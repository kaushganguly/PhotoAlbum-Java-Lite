#!/bin/bash
# This script runs automatically when the Oracle container starts.
#
# It creates the application schema user with LEAST-PRIVILEGE grants only.
# Credentials are read from environment variables (provided by the container
# from docker-compose.yml / .env) and are NOT hard-coded here. It deliberately
# does NOT grant DBA.
#   ORACLE_PWD         - SYS/SYSTEM administrator password
#   APP_USER           - application schema user name (default: photoalbum)
#   APP_USER_PASSWORD  - application schema user password
set -euo pipefail

: "${ORACLE_PWD:?ORACLE_PWD must be set}"
: "${APP_USER:=photoalbum}"
: "${APP_USER_PASSWORD:?APP_USER_PASSWORD must be set}"

APP_USER_UPPER=$(printf '%s' "$APP_USER" | tr '[:lower:]' '[:upper:]')

sqlplus -s "system/${ORACLE_PWD}@//localhost:1521/XE" <<EOF
SET SERVEROUTPUT ON
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DECLARE
    user_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO user_exists FROM dba_users WHERE username = '${APP_USER_UPPER}';

    IF user_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER "${APP_USER_UPPER}" IDENTIFIED BY "${APP_USER_PASSWORD}"';
    END IF;

    -- Least-privilege, schema-scoped grants for Hibernate (ddl-auto=create).
    -- No DBA and no system-wide "ANY" privileges.
    EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE TABLE TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE SEQUENCE TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE PROCEDURE TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE TRIGGER TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE TYPE TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'GRANT CREATE SYNONYM TO "${APP_USER_UPPER}"';
    EXECUTE IMMEDIATE 'ALTER USER "${APP_USER_UPPER}" QUOTA UNLIMITED ON USERS';
    EXECUTE IMMEDIATE 'ALTER USER "${APP_USER_UPPER}" DEFAULT TABLESPACE USERS';
    EXECUTE IMMEDIATE 'ALTER USER "${APP_USER_UPPER}" TEMPORARY TABLESPACE TEMP';

    DBMS_OUTPUT.PUT_LINE('Application user ${APP_USER_UPPER} is ready');
END;
/

exit;
EOF

echo "User creation script completed."
