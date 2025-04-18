-- Job Seekers Table
CREATE TABLE JOB_SEEKERS 
(
    JOB_SEEKER_ID NUMBER DEFAULT JOB_SEEKERS_SEQ.NEXTVAL,
    FULL_NAME VARCHAR2(100) NOT NULL,
    ID_NUMBER VARCHAR2(50) UNIQUE,
    PHONE_NUMBER VARCHAR2(20),
    EMAIL_ADDRESS VARCHAR2(100) UNIQUE,
    JOB_PREFERENCE VARCHAR2(200),

    CONSTRAINT JOB_SEEKERS_PK PRIMARY KEY(JOB_SEEKER_ID)
);

-- Resume Table
CREATE TABLE RESUMES 
(
    RESUME_ID NUMBER DEFAULT RESUMES_SEQ.NEXTVAL,
    JOB_SEEKER_ID NUMBER,
    FILE_NAME VARCHAR2(200),
    FILE_FORMAT VARCHAR2(50),
    UPLOAD_DATE DATE DEFAULT SYSDATE,

    CONSTRAINT RESUMES_PK PRIMARY KEY(RESUME_ID),
    CONSTRAINT RESUMES_SEEKERS_FK FOREIGN KEY (JOB_SEEKER_ID) REFERENCES JOB_SEEKERS(JOB_SEEKER_ID) ON DELETE CASCADE
);

-- Work Experience Table
CREATE TABLE WORK_EXP 
(
    WORK_EXPERIENCE_ID NUMBER DEFAULT WORK_EXP_SEQ.NEXTVAL,
    JOB_SEEKER_ID NUMBER,
    COMPANY_NAME VARCHAR2(100),
    JOB_TITLE VARCHAR2(100),
    START_DATE DATE,
    END_DATE DATE,

    CONSTRAINT WORK_EXP_PK PRIMARY KEY(WORK_EXPERIENCE_ID),
    CONSTRAINT WORK_EXP_SEEKERS_FK FOREIGN KEY (JOB_SEEKER_ID) REFERENCES JOB_SEEKERS(JOB_SEEKER_ID) ON DELETE CASCADE
);

-- Resume Work Experience Junction Table
CREATE TABLE RESUME_WORK_EXP 
(
    RESUME_ID NUMBER,
    WORK_EXPERIENCE_ID NUMBER,

    CONSTRAINT RESUME_WORK_EXP_PK PRIMARY KEY (RESUME_ID, WORK_EXPERIENCE_ID),
    CONSTRAINT RWE_RESUMES_FK FOREIGN KEY (RESUME_ID) REFERENCES RESUMES(RESUME_ID) ON DELETE CASCADE,
    CONSTRAINT RWE_WORK_EXP_FK FOREIGN KEY (WORK_EXPERIENCE_ID) REFERENCES WORK_EXP(WORK_EXPERIENCE_ID) ON DELETE CASCADE
);

-- Education Table
CREATE TABLE EDUCATION 
(
    EDUCATION_ID NUMBER DEFAULT EDUCATION_SEQ.NEXTVAL,
    JOB_SEEKER_ID NUMBER,
    QUALIFICATION VARCHAR2(200),
    COURSE VARCHAR2(200),
    INSTITUTION_NAME VARCHAR2(200),
    GRADUATION_YEAR NUMBER,
    CGPA NUMBER,

    CONSTRAINT EDUCATION_PK PRIMARY KEY(EDUCATION_ID),
    CONSTRAINT EDUCATION_SEEKERS_FK FOREIGN KEY (JOB_SEEKER_ID) REFERENCES JOB_SEEKERS(JOB_SEEKER_ID) ON DELETE CASCADE
);

-- Resume Education Junction Table
CREATE TABLE RESUME_EDUCATION 
(
    RESUME_ID NUMBER,
    EDUCATION_ID NUMBER,

    CONSTRAINT RESUME_EDUCATION_PK PRIMARY KEY (RESUME_ID, EDUCATION_ID),
    CONSTRAINT RE_RESUMES_FK FOREIGN KEY (RESUME_ID) REFERENCES RESUMES(RESUME_ID) ON DELETE CASCADE,
    CONSTRAINT RE_EDUCATION_FK FOREIGN KEY (EDUCATION_ID) REFERENCES EDUCATION(EDUCATION_ID) ON DELETE CASCADE
);

