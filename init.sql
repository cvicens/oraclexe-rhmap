ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

CREATE OR REPLACE PROCEDURE hr.testproc (p_in IN VARCHAR2, p_inout IN OUT VARCHAR2, p_out OUT NUMBER)
    AS
BEGIN
    p_inout := p_in || p_inout;
    p_out := 101;
END;

/