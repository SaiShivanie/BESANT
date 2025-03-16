create database sqlproject;
use sqlproject;

drop database sqlproject;

-- 1. Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password VARCHAR(255),
    user_type ENUM('JobSeeker', 'Employer') -- Differentiates between job seekers and employers
);

-- 2. Job Seekers Profile Table
CREATE TABLE job_seekers (
    seeker_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    resume TEXT,
    skills VARCHAR(255),
    experience INT, -- years of experience
    education VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 3. Employers Profile Table
CREATE TABLE employers (
    employer_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    company_name VARCHAR(255),
    company_address TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 4. Jobs Table
CREATE TABLE jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    employer_id INT,
    job_title VARCHAR(255),
    job_description TEXT,
    job_type ENUM('Full-time', 'Part-time', 'Contract'),
    location VARCHAR(255),
    salary_range VARCHAR(100),
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES employers(employer_id)
);

-- 5. Job Applications Table
CREATE TABLE job_applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    seeker_id INT,
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shortlisted', 'Rejected', 'Hired') DEFAULT 'Pending',
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (seeker_id) REFERENCES job_seekers(seeker_id)
);

-- 6. Job Seeker Skills Table
CREATE TABLE seeker_skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    seeker_id INT,
    skill_name VARCHAR(100),
    FOREIGN KEY (seeker_id) REFERENCES job_seekers(seeker_id)
);

-- 7. Admin Table
CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 1. Register a Job Seeker
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('John', 'Doe', 'johndoe@gmail.com', '1234567890', '123', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('DeviPriya', 'Elangovan', 'devipriya@gmail.com', '9736282626', 'dsp', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Priyashree', 'Haridoss', 'priyashreehari@gmail.com', '8965519224', 'priya', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Ramya', 'Sivakumar', 'ramyas@gmail.com', '9960456769', 'ramyask', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Reeta', 'Anthony', 'reeta85@gmail.com', '7583630284', 'christ', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Amritha', 'Prapakaran', 'amrithap@gmail.com', '9441536457', 'cse123', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Abhinaya', 'Balakrishnan', 'abhinayab@gmail.com', '9876580234', 'abhi03', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Dharshan', 'Sridhar', 'dharshan@gmail.com', '9876543210', 'dharsh01', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Gayathri', 'Ravi', 'gayathri14@gmail.com', '7583203680', 'gayu14', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Deepesh', 'Siva', 'deepesh@gmail.com', '9435212656', 'deepesh1234', 'JobSeeker');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Preetha', 'Udhayakumar', 'preethaau@gmail.com', '8976543210', 'preethaa1010', 'JobSeeker');

-- Getting the user_id of the newly registered job seeker
SET @user_id = LAST_INSERT_ID();

INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, C', 1, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'C, Python', 3, 'Bachelors in Electrical and Electronics');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'C, Python', 4, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, C, Python', 2, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, C, SQL', 3, 'Bachelors in Information Technology');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, Python, HTML', 5, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Python', 1, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, Python', 6, 'Bachelors in Artificial Intelligence and Data Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java, Python', 2, 'Bachelors in Artificial Intelligence and Data Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Python', 3, 'Bachelors in Computer Science');
INSERT INTO job_seekers (user_id, resume, skills, experience, education) 
VALUES (@user_id, 'Link to resume.pdf', 'Java', 1, 'Bachelors in Information Technology');


-- 2. Register an Employer
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Jane', 'Smith', 'jane.smith@oracle.com', '555-5678', 'employerpass', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Murali', 'Raju', 'murali.r@tcs.com', '9084110541', 'murali26', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Haridoss', 'Ezhumalai', 'hari.doss@zoho.com', '8659512942', 'hari07', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Jayanthi', 'Elangovan', 'jaya.elangovan01@arunatech.com', '7369286226', 'jaya156', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Sathyabama', 'Sivakumar', 'sathyabama.sivakumar@zemoso.com', '9490656579', 'sathya36', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Ponnila', 'Subramani', 'ponnila.s03@cts.com', '8781761298', 'ponnila0313', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Catherine', 'Peter', 'catherinemaria.peter@tcs.com', '7789054213', 'cathy07', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Sulaksha', 'Balakrishnan', 'sulaksha.balu@soncom.com', '9907854326', 'sulaksha123', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Lakshmi', 'Ravi', 'lakshmi.ravi25@accenture.com', '8982376543', 'lakshu25', 'Employer');
INSERT INTO users (first_name, last_name, email, phone, password, user_type) 
VALUES ('Shreemathi', 'Dilli', 'shreemathi.dilli@ubtech.com', '9087665409', 'shree2003', 'Employer');

-- Getting the user_id of the newly registered employer
SET @user_id = LAST_INSERT_ID();

INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'TechCorp', '123 Tech Street, Silicon Valley');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'TCS', 'Perungudi');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'ZOHO', 'Gopalapuram');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'ARUNATECH', 'Ahmedabad');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'ZEMOSO', '453 Tech Street,Hyderabad');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'CTS', 'Demonty Colony Street, Alwarpet');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'TCS', 'SIPCOT Tech Park, Siruseri');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'SONCOM', 'Gandhi Street, Kazhipattur');
INSERT INTO employers (user_id, company_name, company_address) 
VALUES (@user_id, 'ACCENTURE', 'Laxmi Nagar, Shollinganallur');


-- 3. Post a Job by Employer
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (1, 'Software Developer', 'Develop and maintain web applications', 'Full-time', 'Remote', '$60,000 - $80,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (2, 'Full Stack Developer', 'responsible for working on both front-end and back-end development processes.', 'Full-time', 'Remote', '$50,000 - $90,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (3, 'SQL Developer', 'develop and manage SQL databases ', 'Part-time', 'Remote', '$30,000 - $60,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (4, 'Software Tester', 'responsible for designing and running tests on software usability.', 'Part-time', 'Remote', '$40,000 - $80,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (5, 'Software Developer', 'Develop and maintain web applications', 'Full-time', 'Remote', '$60,000 - $80,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (6, 'Software Tester', 'responsible for designing and running tests on software usability.', 'Part-time', 'Remote', '$40,000 - $60,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (7, 'Full Stack Developer', 'responsible for working on both front-end and back-end development processes.', 'Full-time', 'Remote', '$60,000 - $90,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (8, 'UI/UX Designer', 'gathering user requirements, designing graphic elements, and developing navigation components.', 'Contract', 'Remote', '$40,000 - $70,000');
INSERT INTO jobs (employer_id, job_title, job_description, job_type, location, salary_range)
VALUES (9, 'UI/UX Designer', 'gathering user requirements, designing graphic elements, and developing navigation components.', 'Contract', 'Remote', '$40,000 - $70,000');

select * from jobs;
select * from job_seekers;
select * from users;

-- 4. Job Seeker Applying for a Job
INSERT INTO job_applications (job_id, seeker_id)
VALUES (1, 1);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (1, 2);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (2, 2);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (2, 3);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (3, 3);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (4, 4);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (5, 5);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (5, 6);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (6, 6);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (7, 7);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (8, 8);
INSERT INTO job_applications (job_id, seeker_id)
VALUES (9, 9);

select * from job_applications;

-- 5. Get Jobs for Job Seekers Based on Location
SELECT job_title, job_description, location, salary_range 
FROM jobs 
WHERE location = 'Remote';

-- 6. Get Applications for a Specific Job (Employer)

SELECT u.first_name, u.last_name, a.status
FROM job_applications a
JOIN job_seekers js ON a.seeker_id = js.seeker_id
JOIN users u ON js.user_id = u.user_id
WHERE a.job_id = 1;

-- 7. Admin View All Job Postings
SELECT j.job_title, e.company_name, j.location, j.salary_range, j.post_date
FROM jobs j
JOIN employers e ON j.employer_id = e.employer_id;

-- tasks 
-- 1. Job Seekers: Implement a job search based on keywords, location, salary, job type, etc.
SELECT * FROM jobs WHERE job_title LIKE '%Developer' AND location ="remote" AND salary_range between '$40000' and '$80000' and job_type = 'Full-time';

-- 2. Employers: Ability to search and filter job seekers based on skills, experience, and education.
SELECT 
    users.first_name, 
    users.last_name, 
    job_seekers.skills, 
    job_seekers.experience, 
    job_seekers.education
FROM users 
JOIN job_seekers 
    ON users.user_id = job_seekers.user_id where (job_seekers.skills like '%Python%' or job_seekers.skills like '%Java%' ) and (job_seekers.experience > 1) and (job_seekers.education like '%Computer%');

-- 3. Application Status Updates: Employers can update the status of job applications (e.g., Shortlisted, Rejected, Hired).
UPDATE job_applications 
SET status = 'Hired' 
WHERE job_id = 2 AND seeker_id IN (2,3); 

UPDATE job_applications 
SET status = 'Shortlisted' 
WHERE job_id = 5 AND seeker_id IN (5,6); 

UPDATE job_applications 
SET status = 'Rejected' 
WHERE application_id in(12,13);

-- 4. Admin Dashboard : Admin can manage job seekers, employers, and job postings (approve/reject job posts, block/unblock users).
ALTER TABLE jobs ADD COLUMN posts_status ENUM('Approved', 'Rejected') DEFAULT 'Approved';

UPDATE jobs 
SET posts_status = 'Rejected' -- Change to 'Rejected' if necessary
WHERE employer_id in (8,9);

ALTER TABLE jobs ADD COLUMN account_status ENUM('Accepted', 'Blocked') DEFAULT 'Accepted';
UPDATE jobs
SET account_status = 'Blocked'
WHERE employer_id in (8,9);

-- 5. Notifications: Email or system notifications for job seekers when their application status changes or when a new job is posted.
CREATE TABLE notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,  -- user=>'Job seeker' ID
    message TEXT,
    status ENUM('unread', 'read') DEFAULT 'unread',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES job_seekers(user_id)
);

INSERT INTO notifications (user_id, message) 
SELECT seeker_id, CONCAT('Your application status has changed to ', status)
FROM job_applications 
WHERE application_id = 2;

INSERT INTO notifications (user_id, message) 
SELECT seeker_id, 'A new job has been posted. Check it out!' 
FROM job_seekers;

UPDATE notifications SET status = 'read' WHERE user_id = 2;

SELECT * FROM notifications WHERE user_id = 2 AND status = 'read';

-- 6.User Authentication and Authorization: Job seekers and employers can log in using their credentials, and each will have different views and permissions.
-- user credentials verification
SELECT 
    first_name, 
    user_type, 
    CASE 
        WHEN password = 'priya' THEN 'user exist' 
        ELSE 'no user' 
    END AS users
FROM users
WHERE first_name = 'priyashree';

-- employer's credentials verification
SELECT 
    first_name, 
    user_type, 
    CASE 
        WHEN first_name = 'Murali' THEN 'user exist' 
        ELSE 'no user' 
    END AS users
FROM users
WHERE first_name='Murali' and user_type = 'Employer';

-- 7. Allow job seekers to upload their resumes (PDF, DOCX formats).
ALTER TABLE job_seekers
MODIFY COLUMN resume blob;
select * from job_seekers;

UPDATE job_seekers 
SET resume = 'E:\SAI SHIVANIE M RESUME.pdf'
WHERE user_id = 1;

UPDATE job_seekers 
SET resume = 'E:\Resume.docx'
WHERE user_id = 3;

UPDATE job_seekers 
SET resume = 'E:\Besant_Resume.docx'
WHERE user_id = 5;

UPDATE job_seekers 
SET resume = 'E:\SAI_SHIVANIE_RESUME_GOLDMAN_SACHS.pdf'
WHERE user_id = 7;

-- 8. Ratings and Reviews: Employers can rate job seekers after hiring, and job seekers can review employers.
CREATE TABLE employer_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    employer_id INT,  -- Who is reviewing?
    seeker_id INT,  -- Who is being reviewed?
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES employers(employer_id),
    FOREIGN KEY (seeker_id) REFERENCES job_seekers(seeker_id)
);
CREATE TABLE job_seeker_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    seeker_id INT,  -- Who is reviewing?
    employer_id INT,  -- Who is being reviewed?
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seeker_id) REFERENCES job_seekers(seeker_id),
    FOREIGN KEY (employer_id) REFERENCES employers(employer_id)
);

-- employer's review on job seeker
INSERT INTO employer_reviews (employer_id, seeker_id, rating, review)
VALUES (1, 3, 5, 'Great worker, very professional!');

INSERT INTO employer_reviews (employer_id, seeker_id, rating, review) 
VALUES (2, 5, 4, 'Good communication and technical skills.');

INSERT INTO employer_reviews (employer_id, seeker_id, rating, review) 
VALUES (3, 7, 3, 'Decent performance, but needs improvement in deadlines.');

INSERT INTO employer_reviews (employer_id, seeker_id, rating, review) 
VALUES (4, 2, 5, 'Excellent work, very professional and skilled.');

INSERT INTO employer_reviews (employer_id, seeker_id, rating, review) 
VALUES (5, 6, 2, 'Lacks consistency and needs better time management.');

INSERT INTO employer_reviews (employer_id, seeker_id, rating, review) 
VALUES (1, 8, 4, 'Strong technical skills, but can improve soft skills.');

-- job seeker's review on employers
INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (3, 1, 4, 'Good company but could improve communication.');

INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (5, 2, 5, 'Great work environment and supportive team.');

INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (7, 3, 3, 'Decent company but needs better project management.');

INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (2, 4, 4, 'Good pay and benefits, but work-life balance can be improved.');

INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (6, 5, 2, 'Poor management and long working hours.');

INSERT INTO job_seeker_reviews (seeker_id, employer_id, rating, review)
VALUES (8, 1, 5, 'Amazing company with a lot of growth opportunities.');

select * from job_seeker_reviews;
select * from employer_reviews;








