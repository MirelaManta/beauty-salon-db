
CREATE TABLE clients (
    clientId INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    phoneNumber CHAR(12) NOT NULL,
    dateOfBirth DATE NOT NULL,
    email VARCHAR(50) NOT NULL
);

insert into clients (firstName, lastName, phoneNumber, dateOfBirth, email) 
values ( 'Manta', 'Mirela', '0787639546', '1999-10-19', 'mirela.manta22@yahoo.com'), ('Oprea'
, 'Tiberiu', '0753469890', '1996-01-08', 'tibi.oprea26@gmail.com'), ('Manta', 'Elena', '0785123459', '1996-04-14', 'ale.elena12@yahoo.com'), 
('Popa', 'Dragos', '0721456789', '1978-12-13', 'dragos.popa12@outlook.com'), ('Florea', 'Vasilica', '0735126458', '1956-12-17', 'floreavas@yahoo.com');


CREATE TABLE employees (
    employeesId INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    employmentDate DATE NOT NULL,
    profLevel CHAR(10) NOT NULL
);

insert into employees (firstName, lastName, employmentDate, profLevel) 
values ('Dima', 'Alexandra', '2022-09-26', 'junior'), ('Nuta', 'Angela', '2015-06-12', 'master'), ('Stoica', 'Felicia', '2019-02-21', 'senior'), 
('Georgescu', 'Dan', '2018-03-09', 'master'), ('Vlasa', 'Alexandra', '2022-11-04', 'junior'), ('Nicolae', 'Adrian', '2020-10-18', 'senior');

CREATE TABLE services (
    serviceId INT PRIMARY KEY AUTO_INCREMENT,
    price INT NOT NULL,
    service_name VARCHAR(50),
    service_providerID INT NOT NULL,
    CONSTRAINT fk_service_employee FOREIGN KEY (service_providerID)
        REFERENCES employees (employeesId)
);

insert into services (price, service_name, service_providerID)
values (100, 'Manichiura + aplicare oja OPI', 2), ('400', 'Tratament facial anti-acneic', 5), ('150', 'Manichiura cu gel', 2), ('200', 'Coafat par lung',  3), (600, 'Manopera + vopsea tehnica Balayage', 1), 
(75, 'Pensat', 6), (600, 'Epilare cu laser', 6), (80, 'Tuns + aranjat barba', 4), (175, 'Tuns barbati', 4);

CREATE TABLE appointments (
    appointmentId INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    appointmentDate DATE NOT NULL,
    service_id INT NOT NULL,
    CONSTRAINT fk_clientAppointment FOREIGN KEY (client_id)
        REFERENCES clients (clientId),
    CONSTRAINT fk_serviceAppointment FOREIGN KEY (service_id)
        REFERENCES services (serviceId)
);
    
 insert into appointments (client_id, appointmentDate, service_id) 
 values (1, '2022-08-12', 2),(4, '2022-08-30', 6), (5, '2022-12-18', 7), (2, '2023-01-03', 8),
 (1, '2022-11-21', 1), (2,'2022-05-21', 3), (3, '2022-09-23', 3), (5, '2022-12-31', 9);

desc appointments;
desc services;
SELECT * FROM clients;
SELECT * FROM employees;
SELECT * FROM services;
SELECT * FROM appointments;

insert into clients (firstName, lastName, phoneNumber, dateOfBirth, email)
values ('Dusty', 'Petrica', '0787964521', '2020-03-08', 'dusty.petri@catmail.com');


select * from clients cross join appointments;
select * from clients inner join appointments on  clients.clientId = appointments.client_id;
select * from employees inner join services on employees.employeesId = services.service_providerID;
select * from appointments inner join services on appointments.service_id = services.serviceId;
select * from clients right join appointments on clients.clientId = appointments.client_id;
select * from appointments right join clients on appointments.client_id = clients.clientId where appointmentId is not null;
select * from services left join employees on services.service_providerID = employees.employeesId;
select * from services left join appointments on services.serviceId = appointments.service_id where appointments.appointmentId is not null;

select * from employees where firstName like '%ta';
select * from employees where profLevel = 'junior';


