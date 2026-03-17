-- Fix tire_code_seq to start after the highest existing code
-- Get the maximum code value and set sequence to MAX+1
DO $$
DECLARE
  max_code INTEGER;
BEGIN
  SELECT COALESCE(MAX(CAST("codePublic" AS INTEGER)), 99) INTO max_code FROM "tire_codes";
  EXECUTE 'ALTER SEQUENCE tire_code_seq RESTART WITH ' || (max_code + 1);
  RAISE INFO 'Sequence tire_code_seq restarted to %', max_code + 1;
END $$;
