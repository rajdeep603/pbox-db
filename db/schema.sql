CREATE SCHEMA IF NOT EXISTS "master";
CREATE SCHEMA IF NOT EXISTS "propertybox"

CREATE OR REPLACE FUNCTION haversine_distance(
    lat1 FLOAT, lon1 FLOAT,
    lat2 FLOAT, lon2 FLOAT
) RETURNS FLOAT AS $$
DECLARE
    R FLOAT := 6371000; -- Earth's radius in meters
    dlat FLOAT := radians(lat2 - lat1);
    dlon FLOAT := radians(lon2 - lon1);
    a FLOAT := sin(dlat/2)^2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon/2)^2;
    c FLOAT := 2 * atan2(sqrt(a), sqrt(1-a));
BEGIN
    RETURN R * c;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION haversine_distance(
  lat1 DOUBLE PRECISION,
  lon1 DOUBLE PRECISION,
  lat2 DOUBLE PRECISION,
  lon2 DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION AS $$
BEGIN
  RETURN 6371 * acos(
    cos(radians(lat1)) * cos(radians(lat2)) *
    cos(radians(lon2) - radians(lon1)) +
    sin(radians(lat1)) * sin(radians(lat2))
  );
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;