
-- IT SERVICE DESK TICKET ANALYSIS
-- SQL ANALYSIS FILE


-- 1. TOTAL TICKETS

SELECT COUNT(*) AS TotalTickets
FROM Tickets;



-- 2. TICKETS RESOLVED
-- (ClosedDate NOT NULL)

SELECT COUNT(*) AS TicketsResolved
FROM Tickets
WHERE ClosedDate IS NOT NULL;



-- 3. AVERAGE RESOLUTION HOURS

SELECT AVG(ResolutionHours) AS AvgResolutionHours
FROM Tickets;



-- 4. AVERAGE RESOLUTION DAYS

SELECT AVG(ResolutionDays) AS AvgResolutionDays
FROM Tickets;



-- 5. TICKETS BY PRIORITY

SELECT Priority,
       COUNT(*) AS TicketCount
FROM Tickets
GROUP BY Priority
ORDER BY TicketCount DESC;



-- 6. TICKETS BY ISSUE TYPE

SELECT IssueType,
       COUNT(*) AS TicketCount
FROM Tickets
GROUP BY IssueType
ORDER BY TicketCount DESC;



-- 7. TICKETS BY TECHNICIAN

SELECT AssignedTechnician,
       COUNT(*) AS TicketCount
FROM Tickets
GROUP BY AssignedTechnician
ORDER BY TicketCount DESC;



-- 8. SLA COMPLIANCE BREAKDOWN
-- Uses SLAMetNumeric: 1 = met, 0 = missed

SELECT 
    SUM(SLAMetNumeric) AS TicketsMetSLA,
    COUNT(*) AS TotalTickets,
    (SUM(SLAMetNumeric) * 1.0 / COUNT(*)) AS SLAComplianceRate
FROM Tickets;


-- 9. AVERAGE SLA TARGET HOURS

SELECT AVG(SLATargetHours) AS AvgSLATargetHours
FROM Tickets;



-- 10. MONTHLY TICKET TREND

SELECT 
    DATEFROMPARTS(YEAR(CreatedDate), MONTH(CreatedDate), 1) AS Month,
    COUNT(*) AS TicketsCreated
FROM Tickets
GROUP BY DATEFROMPARTS(YEAR(CreatedDate), MONTH(CreatedDate), 1)
ORDER BY Month;


-- 11. MONTHLY RESOLUTION HOURS TREND

SELECT 
    DATEFROMPARTS(YEAR(CreatedDate), MONTH(CreatedDate), 1) AS Month,
    AVG(ResolutionHours) AS AvgResolutionHours
FROM Tickets
GROUP BY DATEFROMPARTS(YEAR(CreatedDate), MONTH(CreatedDate), 1)
ORDER BY Month;
