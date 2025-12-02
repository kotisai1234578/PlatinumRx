SELECT b.user_id,
       b.room_no
FROM bookings b
JOIN (
  SELECT user_id, MAX(booking_date) AS last_booking_date
  FROM bookings
  GROUP BY user_id
) last_b ON b.user_id = last_b.user_id
       AND b.booking_date = last_b.last_booking_date;
