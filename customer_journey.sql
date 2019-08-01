CREATE TABLE marketing.cj_brand AS
   
SELECT
CURRENT_DATE
, *
, CASE
    WHEN purchased = 'T' THEN 'customer'
    WHEN (viewed_store_page = 'T' OR added_to_cart = 'T') AND purchased = 'F' THEN 'decision'
    WHEN downloaded_free_trial = 'T' AND viewed_store_page = 'F' AND added_to_cart = 'F' AND purchased = 'F' THEN 'evaluation'
    WHEN viewed_3pgs = 'T' AND downloaded_free_trial = 'F' AND downloaded_free_trial = 'F' AND viewed_store_page = 'F' AND added_to_cart = 'F' AND purchased = 'F'THEN 'interest'
    WHEN viewed_1pgs = 'T' AND viewed_3pgs = 'F' AND downloaded_free_trial = 'F' AND downloaded_free_trial = 'F' AND viewed_store_page = 'F' AND added_to_cart = 'F' AND purchased = 'F' THEN 'awareness'
    END AS cj_stage
           
FROM (
   
    SELECT
      min_date
    , max_date
        , txn_date1 AS txn_date
    , "product name"
    , domain_userid
    , LAST_VALUE(days_active_before_txn) OVER (PARTITION BY domain_userid) days_active_before_txn
    , LAST_VALUE(days_active_after_txn) OVER (PARTITION BY domain_userid) days_active_after_txn
    , LAST_VALUE(days_since_active) OVER (PARTITION BY domain_userid) days_since_active
    , LAST_VALUE(total_days_active) OVER (PARTITION BY domain_userid) total_days_active
    , LAST_VALUE("viewed_1pgs") OVER (PARTITION BY domain_userid) "viewed_1pgs"
    , LAST_VALUE("viewed_3pgs") OVER (PARTITION BY domain_userid) "viewed_3pgs"
    , LAST_VALUE("downloaded_free_trial") OVER (PARTITION BY domain_userid) "downloaded_free_trial"
    , LAST_VALUE("viewed_store_page") OVER (PARTITION BY domain_userid) "viewed_store_page"
    , LAST_VALUE("added_to_cart") OVER (PARTITION BY domain_userid) "added_to_cart"
    , LAST_VALUE("abandoned_cart") OVER (PARTITION BY domain_userid) "abandoned_cart"
    , LAST_VALUE("purchased") OVER (PARTITION BY domain_userid) "purchased"
   
    FROM (
   
        SELECT
        *
        , COALESCE(FIRST_VALUE((CASE WHEN event_number = 1 AND event = 'page_view' THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "viewed_1pgs"
        , COALESCE(FIRST_VALUE((CASE WHEN event_number = 3 AND event = 'page_view' THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "viewed_3pgs"
        , COALESCE(FIRST_VALUE((CASE WHEN se_action = 'free-trial' THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "downloaded_free_trial"
        , COALESCE(FIRST_VALUE((CASE WHEN page_urlpath IN('/brand/store.asp', '/brand/store-cb.asp') THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "viewed_store_page"
        , COALESCE(FIRST_VALUE((CASE WHEN se_action = 'add-to-cart' THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "added_to_cart"
        , COALESCE(FIRST_VALUE((CASE WHEN page_urlpath LIKE '%ShoppingCart%' AND sales = 0 THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "abandoned_cart"
        , COALESCE(FIRST_VALUE((CASE WHEN event = 'transaction_item' THEN 'T' ELSE NULL END) IGNORE NULLS) OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING), 'F') "purchased"
   
        FROM (
   
            SELECT
            *
            , DENSE_RANK() OVER (PARTITION BY domain_userid, event ORDER BY domain_sessionidx, event_id) event_number
            , DENSE_RANK() OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx) session_number
            , DENSE_RANK() OVER (PARTITION BY domain_userid ORDER BY domain_sessionidx, event_id) hit_number
            , MIN(date) OVER (PARTITION BY domain_userid) min_date
            , MIN(txn_date) OVER (PARTITION BY domain_userid) txn_date1
            , MAX(date) OVER (PARTITION BY domain_userid) max_date
            , DATEDIFF(day, MIN(date) OVER (PARTITION BY domain_userid), MIN(txn_date) OVER (PARTITION BY domain_userid)) days_active_before_txn
            , DATEDIFF(day, MIN(txn_date) OVER (PARTITION BY domain_userid), MAX(date) OVER (PARTITION BY domain_userid)) days_active_after_txn
            , DATEDIFF(day, MAX(date) OVER (PARTITION BY domain_userid), CURRENT_DATE) days_since_active
            , DATEDIFF(day, MIN(date) OVER (PARTITION BY domain_userid), MAX(date) OVER (PARTITION BY domain_userid)) total_days_active
               
            FROM(
                    SELECT
                    "product name"
                    , date
                    , domain_userid
                    , event_id
                    , domain_sessionidx
                    , CASE WHEN sales = 1 THEN date END AS txn_date
                    , sales
                    , event
                    , se_action
                    , lookup_type
                    , page_urlpath
                    , mkt_medium
                    , refr_source
                    FROM marketing."sql-runner_marketing_performance"
                    WHERE "product name" IN('brand')
            )
            /*
            WHERE domain_userid IN(
                '00492f8a6f0d3dbc' -- transacted customer
                , '0004365cc6a6f867' -- multiple transactions
                , '00f8e2e5bb1ae7a0' -- abandoned cart
                , 'ac588834f553c2fc' -- signed up from free trial
                , '371a15cb7729d36f' -- viewed_store_page
                , '8d404905088b3ea1' -- upgraded
                     ) -- transacted customers
            */
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13
        )
    )
)
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
