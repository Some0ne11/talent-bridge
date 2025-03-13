-- Drop the rows in child tables first to avoid violating referential integrity

DELETE FROM APP_FEEDBACK;  -- Delete from junction table between applications and feedbacks
DELETE FROM FEEDBACKS;  -- Delete feedbacks
DELETE FROM APPLICATIONS;  -- Delete applications
DELETE FROM APPLICATION_STATUS;  -- Delete application statuses
DELETE FROM INTERVIEW_DETAILS;  -- Delete interview details
DELETE FROM RESUME_EDUCATION;  -- Delete junction between resumes and education
DELETE FROM EDUCATION;  -- Delete education records
DELETE FROM RESUME_WORK_EXP;  -- Delete junction between resumes and work experience
DELETE FROM WORK_EXP;  -- Delete work experience records
DELETE FROM RESUMES;  -- Delete resumes

-- Now delete from the parent tables
DELETE FROM JOB_SEEKERS;  -- Delete job seekers

DELETE FROM JOBS_OFFERED_ON_SOCIALS;  -- Delete job offerings on socials
DELETE FROM JOBS_REQUIRED_SKILLS;  -- Delete job required skills
DELETE FROM REQUIRED_SKILLS;  -- Delete required skills
DELETE FROM JOBS_LOCATIONS;  -- Delete job locations
DELETE FROM JOBS;  -- Delete jobs

DELETE FROM COMPANY_SOCIALS;  -- Delete company social media profiles
DELETE FROM COMPANY_DEPARTMENT;  -- Delete company departments
DELETE FROM COMPANY_BRANCHES;  -- Delete company branches
DELETE FROM COMPANY_PROFILE;  -- Delete company profiles
DELETE FROM LOCATIONS;  -- Delete locations
DELETE FROM JOB_TYPES;  -- Delete job types