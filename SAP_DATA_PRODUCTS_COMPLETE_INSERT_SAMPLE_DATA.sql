-- =====================================================================================
-- SAP S/4HANA Data Products - Complete Sample Data INSERT Script
-- =====================================================================================
-- This file contains all INSERT statements to populate the three SAP S/4HANA data products
-- with realistic sample data based on existing data patterns
-- =====================================================================================
-- Generated on: $(date)
-- =====================================================================================

-- =====================================================================================
-- CUSTOMER DATABASE SAMPLE DATA
-- =====================================================================================

USE DATABASE SAP_DATA_PRODUCT_CUSTOMER;
USE SCHEMA PUBLIC;

-- Clear existing data
TRUNCATE TABLE CUSTOMER_ADDRESS_TABLE;
TRUNCATE TABLE CUSTOMER_CONTACT_TABLE;
TRUNCATE TABLE CUSTOMER_MASTER_TABLE;
TRUNCATE TABLE CUSTOMER_GROUP_TABLE;
TRUNCATE TABLE SALES_ORGANIZATION_TABLE;
TRUNCATE TABLE DISTRIBUTION_CHANNEL_TABLE;
TRUNCATE TABLE DIVISION_TABLE;
TRUNCATE TABLE COUNTRY_TABLE;
TRUNCATE TABLE REGION_TABLE;

-- Insert Customer Groups
INSERT INTO CUSTOMER_GROUP_TABLE (CUSTOMER_GROUP, CUSTOMER_GROUP_NAME, CUSTOMER_GROUP_DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES
('01', 'Retail', 'Retail customers', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('02', 'Wholesale', 'Wholesale distributors', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('03', 'Government', 'Government entities', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('04', 'Corporate', 'Large corporations', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('05', 'SME', 'Small and medium enterprises', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('06', 'Enterprise', 'Enterprise clients', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('07', 'Non-Profit', 'Non-profit organizations', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('08', 'Educational', 'Educational institutions', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('09', 'Healthcare', 'Healthcare providers', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('10', 'Other', 'Other customer types', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Sales Organizations
INSERT INTO SALES_ORGANIZATION_TABLE (SALES_ORGANIZATION, SALES_ORGANIZATION_NAME, COMPANY_CODE, CREATED_AT, UPDATED_AT) VALUES
('0001', 'North America Sales', '1000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'North America Sales', '1000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'North America Sales', '1000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'North America Sales', '1000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'North America Sales', '1000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0006', 'Europe Sales', '2000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0007', 'Europe Sales', '2000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0008', 'Europe Sales', '2000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0009', 'Europe Sales', '2000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0010', 'Europe Sales', '2000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0011', 'Asia Pacific Sales', '3000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0012', 'Asia Pacific Sales', '3000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0013', 'Asia Pacific Sales', '3000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0014', 'Asia Pacific Sales', '3000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0015', 'Asia Pacific Sales', '3000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0016', 'Latin America Sales', '4000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0017', 'Latin America Sales', '4000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0018', 'Latin America Sales', '4000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0019', 'Global Sales', '5000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0020', 'Global Sales', '5000', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Distribution Channels
INSERT INTO DISTRIBUTION_CHANNEL_TABLE (DISTRIBUTION_CHANNEL, DISTRIBUTION_CHANNEL_NAME, CREATED_AT, UPDATED_AT) VALUES
('01', 'Direct Sales', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('02', 'Online Sales', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('03', 'Retail Stores', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('04', 'Wholesale', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('05', 'Partner Sales', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('06', 'Reseller', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('07', 'Distributor', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('08', 'Agent', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('09', 'Franchise', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('10', 'Other', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Divisions
INSERT INTO DIVISION_TABLE (DIVISION, DIVISION_NAME, CREATED_AT, UPDATED_AT) VALUES
('01', 'Electronics', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('02', 'Clothing', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('03', 'Home & Garden', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('04', 'Automotive', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('05', 'Sports', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('06', 'Books', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('07', 'Health & Beauty', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('08', 'Food & Beverage', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('09', 'Office Supplies', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('10', 'Toys & Games', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('11', 'Furniture', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('12', 'Jewelry', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('13', 'Tools', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('14', 'Pet Supplies', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('15', 'Other', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Countries
INSERT INTO COUNTRY_TABLE (COUNTRY, COUNTRY_NAME, REGION, CURRENCY, CREATED_AT, UPDATED_AT) VALUES
('US', 'United States', 'NAM', 'USD', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('GB', 'United Kingdom', 'EUR', 'GBP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('DE', 'Germany', 'EUR', 'EUR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('FR', 'France', 'EUR', 'EUR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('JP', 'Japan', 'APJ', 'JPY', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CN', 'China', 'APJ', 'CNY', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('IN', 'India', 'APJ', 'INR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('BR', 'Brazil', 'LAM', 'BRL', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CA', 'Canada', 'NAM', 'CAD', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('AU', 'Australia', 'APJ', 'AUD', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Regions
INSERT INTO REGION_TABLE (REGION, REGION_NAME, COUNTRY, CREATED_AT, UPDATED_AT) VALUES
('NY', 'New York', 'US', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CA', 'California', 'US', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('TX', 'Texas', 'US', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('LON', 'London', 'GB', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('MAN', 'Manchester', 'GB', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('BY', 'Bavaria', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('BW', 'Baden-Württemberg', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('TY', 'Tokyo', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('OS', 'Osaka', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('ON', 'Ontario', 'CA', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Customer Master Data
INSERT INTO CUSTOMER_MASTER_TABLE (CUSTOMER, CUSTOMER_NAME, CITY, COUNTRY, POSTAL_CODE, STREET, REGION, CUSTOMER_GROUP, SALES_ORGANIZATION, DISTRIBUTION_CHANNEL, DIVISION, CUSTOMER_STATUS, CUSTOMER_TYPE, INDUSTRY_SECTOR, TAX_NUMBER, CREATED_AT, UPDATED_AT) VALUES
('CUST001', 'Acme Corporation', 'New York', 'US', '10001', '123 Business Ave', 'NY', '01', '0001', '01', '01', 'A', '01', 'TECH', '12-3456789', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST002', 'Global Industries Ltd', 'London', 'GB', 'SW1A 1AA', '456 Commerce St', 'LON', '02', '0006', '02', '02', 'A', '02', 'MANU', 'GB123456789', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST003', 'Tech Solutions Inc', 'San Francisco', 'US', '94102', '789 Innovation Blvd', 'CA', '03', '0001', '03', '03', 'A', '03', 'TECH', '98-7654321', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST004', 'European Motors GmbH', 'Munich', 'DE', '80331', '321 Auto Strasse', 'BY', '04', '0006', '04', '04', 'A', '04', 'AUTO', 'DE987654321', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST005', 'Asia Pacific Corp', 'Tokyo', 'JP', '100-0001', '654 Business District', 'TY', '05', '0011', '05', '05', 'A', '05', 'TECH', 'JP123456789', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Customer Addresses
INSERT INTO CUSTOMER_ADDRESS_TABLE (CUSTOMER, ADDRESS_TYPE, ADDRESS_NUMBER, STREET, CITY, POSTAL_CODE, COUNTRY, REGION, TELEPHONE, EMAIL, CREATED_AT, UPDATED_AT) VALUES
('CUST001', '01', '0000001', '123 Business Ave', 'New York', '10001', 'US', 'NY', '+1-212-555-0101', 'info@acme.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST001', '02', '0000002', '456 Warehouse Blvd', 'New York', '10002', 'US', 'NY', '+1-212-555-0102', 'warehouse@acme.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST002', '01', '0000003', '456 Commerce St', 'London', 'SW1A 1AA', 'GB', 'LON', '+44-20-7946-0958', 'contact@globalindustries.co.uk', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST002', '02', '0000004', '789 Industrial Park', 'Manchester', 'M1 1AA', 'GB', 'MAN', '+44-161-555-0104', 'factory@globalindustries.co.uk', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST003', '01', '0000005', '789 Innovation Blvd', 'San Francisco', '94102', 'US', 'CA', '+1-415-555-0105', 'hello@techsolutions.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Customer Contacts
INSERT INTO CUSTOMER_CONTACT_TABLE (CUSTOMER, CONTACT_PERSON, CONTACT_ROLE, TELEPHONE, EMAIL, DEPARTMENT, CREATED_AT, UPDATED_AT) VALUES
('CUST001', 'John Smith', '01', '+1-212-555-0101', 'john.smith@acme.com', 'Procurement', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST001', 'Sarah Johnson', '02', '+1-212-555-0102', 'sarah.johnson@acme.com', 'Finance', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST002', 'David Wilson', '01', '+44-20-7946-0958', 'david.wilson@globalindustries.co.uk', 'Purchasing', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST002', 'Emma Brown', '02', '+44-20-7946-0959', 'emma.brown@globalindustries.co.uk', 'Accounts', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('CUST003', 'Michael Chen', '01', '+1-415-555-0105', 'michael.chen@techsolutions.com', 'IT', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- =====================================================================================
-- SALES ORDER DATABASE SAMPLE DATA
-- =====================================================================================

USE DATABASE SAP_DATA_PRODUCT_SALES_ORDER;
USE SCHEMA PUBLIC;

-- Clear existing data
TRUNCATE TABLE SALES_ORDER_ITEM_TABLE;
TRUNCATE TABLE SALES_ORDER_HEADER_TABLE;
TRUNCATE TABLE CUSTOMER_TABLE;
TRUNCATE TABLE MATERIAL_TABLE;
TRUNCATE TABLE SALES_ORGANIZATION_TABLE;
TRUNCATE TABLE DISTRIBUTION_CHANNEL_TABLE;
TRUNCATE TABLE DIVISION_TABLE;
TRUNCATE TABLE SALES_ORDER_TYPE_TABLE;
TRUNCATE TABLE CUSTOMER_GROUP_TABLE;

-- Insert Customer Groups
INSERT INTO CUSTOMER_GROUP_TABLE (CUSTOMER_GROUP, CUSTOMER_GROUP_NAME) VALUES
('01', 'Retail'),
('02', 'Wholesale'),
('03', 'Government'),
('04', 'Corporate'),
('05', 'SME'),
('06', 'Enterprise'),
('07', 'Non-Profit'),
('08', 'Educational'),
('09', 'Healthcare'),
('10', 'Other');

-- Insert Sales Organizations
INSERT INTO SALES_ORGANIZATION_TABLE (SALES_ORGANIZATION, SALES_ORGANIZATION_NAME, COMPANY_CODE) VALUES
('0001', 'North America Sales', '1000'),
('0002', 'North America Sales', '1000'),
('0003', 'North America Sales', '1000'),
('0004', 'North America Sales', '1000'),
('0005', 'North America Sales', '1000'),
('0006', 'Europe Sales', '2000'),
('0007', 'Europe Sales', '2000'),
('0008', 'Europe Sales', '2000'),
('0009', 'Europe Sales', '2000'),
('0010', 'Europe Sales', '2000'),
('0011', 'Asia Pacific Sales', '3000'),
('0012', 'Asia Pacific Sales', '3000'),
('0013', 'Asia Pacific Sales', '3000'),
('0014', 'Asia Pacific Sales', '3000'),
('0015', 'Asia Pacific Sales', '3000'),
('0016', 'Latin America Sales', '4000'),
('0017', 'Latin America Sales', '4000'),
('0018', 'Latin America Sales', '4000'),
('0019', 'Global Sales', '5000'),
('0020', 'Global Sales', '5000');

-- Insert Distribution Channels
INSERT INTO DISTRIBUTION_CHANNEL_TABLE (DISTRIBUTION_CHANNEL, DISTRIBUTION_CHANNEL_NAME) VALUES
('01', 'Direct Sales'),
('02', 'Online Sales'),
('03', 'Retail Stores'),
('04', 'Wholesale'),
('05', 'Partner Sales'),
('06', 'Reseller'),
('07', 'Distributor'),
('08', 'Agent'),
('09', 'Franchise'),
('10', 'Other');

-- Insert Divisions
INSERT INTO DIVISION_TABLE (DIVISION, DIVISION_NAME) VALUES
('01', 'Electronics'),
('02', 'Clothing'),
('03', 'Home & Garden'),
('04', 'Automotive'),
('05', 'Sports'),
('06', 'Books'),
('07', 'Health & Beauty'),
('08', 'Food & Beverage'),
('09', 'Office Supplies'),
('10', 'Toys & Games'),
('11', 'Furniture'),
('12', 'Jewelry'),
('13', 'Tools'),
('14', 'Pet Supplies'),
('15', 'Other');

-- Insert Sales Order Types
INSERT INTO SALES_ORDER_TYPE_TABLE (SALES_ORDER_TYPE, SALES_ORDER_TYPE_NAME) VALUES
('01', 'Standard Order'),
('02', 'Rush Order'),
('03', 'Bulk Order'),
('04', 'Sample Order'),
('05', 'Return Order'),
('06', 'Credit Order'),
('07', 'Consignment'),
('08', 'Contract'),
('09', 'Subscription'),
('10', 'Prepaid'),
('11', 'Installment'),
('12', 'Special');

-- Insert Customers
INSERT INTO CUSTOMER_TABLE (CUSTOMER, CUSTOMER_NAME, CITY, COUNTRY, POSTAL_CODE, STREET, REGION, CUSTOMER_GROUP) VALUES
('CUST001', 'Acme Corporation', 'New York', 'US', '10001', '123 Business Ave', 'NY', '01'),
('CUST002', 'Global Industries Ltd', 'London', 'GB', 'SW1A 1AA', '456 Commerce St', 'LON', '02'),
('CUST003', 'Tech Solutions Inc', 'San Francisco', 'US', '94102', '789 Innovation Blvd', 'CA', '03'),
('CUST004', 'European Motors GmbH', 'Munich', 'DE', '80331', '321 Auto Strasse', 'BY', '04'),
('CUST005', 'Asia Pacific Corp', 'Tokyo', 'JP', '100-0001', '654 Business District', 'TY', '05'),
('CUST006', 'Retail Chain Inc', 'Chicago', 'US', '60601', '789 Retail Street', 'IL', '01'),
('CUST007', 'Manufacturing Co', 'Birmingham', 'GB', 'B1 1AA', '321 Industrial Way', 'WM', '02'),
('CUST008', 'Tech Startup Ltd', 'Berlin', 'DE', '10115', '654 Innovation Hub', 'BE', '03'),
('CUST009', 'Global Retail Corp', 'Sydney', 'AU', '2000', '987 Shopping Center', 'NSW', '01'),
('CUST010', 'Enterprise Solutions', 'Toronto', 'CA', 'M5H 2N2', '456 Enterprise Blvd', 'ON', '06');

-- Insert Materials
INSERT INTO MATERIAL_TABLE (MATERIAL, MATERIAL_TYPE, MATERIAL_DESCRIPTION, BASE_UNIT, MATERIAL_GROUP) VALUES
('MAT001', 'Finished Goods', 'High-end Laptop Computer', 'EA', '01'),
('MAT002', 'Finished Goods', 'Professional Office Chair', 'EA', '02'),
('MAT003', 'Finished Goods', 'Wireless Bluetooth Headphones', 'EA', '01'),
('MAT004', 'Finished Goods', 'Smartphone Accessory Kit', 'EA', '01'),
('MAT005', 'Finished Goods', 'Premium Coffee Maker', 'EA', '03'),
('MAT006', 'Finished Goods', 'Fitness Equipment Set', 'EA', '05'),
('MAT007', 'Finished Goods', 'Home Security System', 'EA', '03'),
('MAT008', 'Finished Goods', 'Automotive Parts Kit', 'EA', '04'),
('MAT009', 'Finished Goods', 'Office Supplies Bundle', 'EA', '09'),
('MAT010', 'Finished Goods', 'Health & Beauty Kit', 'EA', '07');

-- Insert Sales Order Headers
INSERT INTO SALES_ORDER_HEADER_TABLE (SALES_ORDER, CUSTOMER, SALES_ORDER_DATE, REQUESTED_DELIVERY_DATE, TOTAL_NET_AMOUNT, TRANSACTION_CURRENCY, SALES_ORDER_STATUS, OVERALL_SD_PROCESS_STATUS, SALES_ORGANIZATION, DISTRIBUTION_CHANNEL, DIVISION, SALES_ORDER_TYPE) VALUES
('SO0000001', 'CUST001', '2025-01-15', '2025-01-25', 2500.00, 'USD', 'Open', 'In Process', '0001', '01', '01', '01'),
('SO0000002', 'CUST002', '2025-01-16', '2025-01-30', 1800.00, 'GBP', 'Open', 'In Process', '0006', '02', '02', '01'),
('SO0000003', 'CUST003', '2025-01-17', '2025-01-28', 3200.00, 'USD', 'Open', 'In Process', '0001', '03', '01', '02'),
('SO0000004', 'CUST004', '2025-01-18', '2025-02-01', 4500.00, 'EUR', 'Open', 'In Process', '0006', '04', '04', '01'),
('SO0000005', 'CUST005', '2025-01-19', '2025-02-05', 2800.00, 'JPY', 'Open', 'In Process', '0011', '05', '01', '01'),
('SO0000006', 'CUST006', '2025-01-20', '2025-02-02', 1500.00, 'USD', 'Open', 'In Process', '0001', '01', '01', '01'),
('SO0000007', 'CUST007', '2025-01-21', '2025-02-03', 2200.00, 'GBP', 'Open', 'In Process', '0006', '02', '02', '01'),
('SO0000008', 'CUST008', '2025-01-22', '2025-02-04', 3800.00, 'EUR', 'Open', 'In Process', '0006', '03', '01', '02'),
('SO0000009', 'CUST009', '2025-01-23', '2025-02-06', 1900.00, 'AUD', 'Open', 'In Process', '0011', '01', '01', '01'),
('SO0000010', 'CUST010', '2025-01-24', '2025-02-07', 5200.00, 'CAD', 'Open', 'In Process', '0001', '01', '01', '01');

-- Insert Sales Order Items
INSERT INTO SALES_ORDER_ITEM_TABLE (SALES_ORDER, SALES_ORDER_ITEM, MATERIAL, SALES_ORDER_QUANTITY, SALES_ORDER_QUANTITY_UNIT, NET_AMOUNT) VALUES
('SO0000001', 10, 'MAT001', 2.00, 'EA', 2500.00),
('SO0000002', 10, 'MAT002', 1.00, 'EA', 1800.00),
('SO0000003', 10, 'MAT003', 4.00, 'EA', 3200.00),
('SO0000004', 10, 'MAT004', 3.00, 'EA', 4500.00),
('SO0000005', 10, 'MAT005', 2.00, 'EA', 2800.00),
('SO0000006', 10, 'MAT006', 1.00, 'EA', 1500.00),
('SO0000007', 10, 'MAT007', 2.00, 'EA', 2200.00),
('SO0000008', 10, 'MAT008', 1.00, 'EA', 3800.00),
('SO0000009', 10, 'MAT009', 3.00, 'EA', 1900.00),
('SO0000010', 10, 'MAT010', 2.00, 'EA', 5200.00),
('SO0000001', 20, 'MAT002', 1.00, 'EA', 800.00),
('SO0000002', 20, 'MAT003', 2.00, 'EA', 600.00),
('SO0000003', 20, 'MAT004', 1.00, 'EA', 400.00),
('SO0000004', 20, 'MAT005', 2.00, 'EA', 1200.00),
('SO0000005', 20, 'MAT006', 1.00, 'EA', 900.00);

-- =====================================================================================
-- SHIPPING POINT DATABASE SAMPLE DATA
-- =====================================================================================

USE DATABASE SAP_DATA_PRODUCT_SSP;
USE SCHEMA PUBLIC;

-- Clear existing data
TRUNCATE TABLE SHIPPING_POINT_TABLE;
TRUNCATE TABLE PLANT_TABLE;
TRUNCATE TABLE LANGUAGE_TABLE;
TRUNCATE TABLE SHIPPING_POINT_MASTER_TABLE;

-- Insert Languages
INSERT INTO LANGUAGE_TABLE (LANGUAGE_KEY, LANGUAGE_NAME, CREATED_DATE, UPDATED_DATE) VALUES
('EN', 'English', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('DE', 'German', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('FR', 'French', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('ES', 'Spanish', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('IT', 'Italian', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('JP', 'Japanese', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('KO', 'Korean', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('ZH', 'Chinese', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('AR', 'Arabic', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('RU', 'Russian', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Plants
INSERT INTO PLANT_TABLE (PLANT_KEY, PLANT_NAME, PLANT_TYPE, COUNTRY, REGION, CREATED_DATE, UPDATED_DATE) VALUES
('0001', 'Plant 0001', 'Manufacturing', 'US', 'North America', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'Plant 0002', 'Distribution', 'GB', 'Europe', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'Plant 0003', 'Warehouse', 'DE', 'Asia Pacific', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'Plant 0004', 'Service', 'FR', 'Latin America', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'Plant 0005', 'Mixed', 'JP', 'Other', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0006', 'Plant 0006', 'Manufacturing', 'CN', 'North America', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0007', 'Plant 0007', 'Distribution', 'IN', 'Europe', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0008', 'Plant 0008', 'Warehouse', 'BR', 'Asia Pacific', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0009', 'Plant 0009', 'Service', 'CA', 'Latin America', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0010', 'Plant 0010', 'Mixed', 'AU', 'Other', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Shipping Point Master Data
INSERT INTO SHIPPING_POINT_MASTER_TABLE (SHIPPING_POINT, SHIPPING_POINT_DESCRIPTION, PLANT, STORAGE_LOCATION, LOADING_GROUP, SHIPPING_CONDITION, DELIVERY_PRIORITY, TRANSPORTATION_GROUP, CREATED_DATE, UPDATED_DATE) VALUES
('1000', 'Main Warehouse New York - Primary Distribution Center', '1000', '0001', '0001', '01', '01', '0001', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('1001', 'Distribution Center Los Angeles - West Coast Hub', '1001', '0001', '0001', '01', '01', '0001', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('1002', 'Shipping Hub Chicago - Central Distribution', '1002', '0001', '0001', '01', '01', '0001', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('1003', 'Fulfillment Center Miami - Latin America Gateway', '1003', '0001', '0001', '01', '01', '0001', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('1004', 'Logistics Center Seattle - Pacific Northwest', '1004', '0001', '0001', '01', '01', '0001', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('2000', 'Central Warehouse Berlin - European Headquarters', '2000', '0001', '0001', '01', '01', '0002', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('2001', 'Distribution Hub London - UK Operations', '2001', '0001', '0001', '01', '01', '0002', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('2002', 'Shipping Center Paris - French Market', '2002', '0001', '0001', '01', '01', '0002', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('2003', 'Logistics Hub Amsterdam - Benelux Region', '2003', '0001', '0001', '01', '01', '0002', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('3000', 'Main Distribution Tokyo - Japan Operations', '3000', '0001', '0001', '01', '01', '0003', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- Insert Shipping Points (Multilingual)
INSERT INTO SHIPPING_POINT_TABLE (SHIPPING_POINT, SHIPPING_POINT_NAME, LANGUAGE, CREATED_DATE, UPDATED_DATE) VALUES
-- English
('0001', 'Shipping Point 0001', 'EN', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'Shipping Point 0002', 'EN', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'Shipping Point 0003', 'EN', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'Shipping Point 0004', 'EN', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'Shipping Point 0005', 'EN', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),

-- German
('0001', 'Versandstelle 0001', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'Versandstelle 0002', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'Versandstelle 0003', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'Versandstelle 0004', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'Versandstelle 0005', 'DE', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),

-- French
('0001', 'Point d''expédition 0001', 'FR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'Point d''expédition 0002', 'FR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'Point d''expédition 0003', 'FR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'Point d''expédition 0004', 'FR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'Point d''expédition 0005', 'FR', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),

-- Spanish
('0001', 'Punto de envío 0001', 'ES', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', 'Punto de envío 0002', 'ES', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', 'Punto de envío 0003', 'ES', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', 'Punto de envío 0004', 'ES', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', 'Punto de envío 0005', 'ES', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),

-- Japanese
('0001', '出荷ポイント 0001', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0002', '出荷ポイント 0002', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0003', '出荷ポイント 0003', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0004', '出荷ポイント 0004', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
('0005', '出荷ポイント 0005', 'JP', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

-- =====================================================================================
-- VERIFICATION AND COMPLETION
-- =====================================================================================

-- Verify Customer Database
USE DATABASE SAP_DATA_PRODUCT_CUSTOMER;
SELECT 'CUSTOMER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS CUSTOMER_GROUPS FROM CUSTOMER_GROUP_TABLE
UNION ALL
SELECT 'CUSTOMER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS SALES_ORGANIZATIONS FROM SALES_ORGANIZATION_TABLE
UNION ALL
SELECT 'CUSTOMER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS CUSTOMERS FROM CUSTOMER_MASTER_TABLE;

-- Verify Sales Order Database
USE DATABASE SAP_DATA_PRODUCT_SALES_ORDER;
SELECT 'SALES_ORDER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS SALES_ORDERS FROM SALES_ORDER_HEADER_TABLE
UNION ALL
SELECT 'SALES_ORDER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS SALES_ORDER_ITEMS FROM SALES_ORDER_ITEM_TABLE
UNION ALL
SELECT 'SALES_ORDER_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS CUSTOMERS FROM CUSTOMER_TABLE;

-- Verify Shipping Point Database
USE DATABASE SAP_DATA_PRODUCT_SSP;
SELECT 'SHIPPING_POINT_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS SHIPPING_POINTS FROM SHIPPING_POINT_TABLE
UNION ALL
SELECT 'SHIPPING_POINT_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS PLANTS FROM PLANT_TABLE
UNION ALL
SELECT 'SHIPPING_POINT_DATABASE_VERIFICATION' AS STATUS, 
       COUNT(*) AS LANGUAGES FROM LANGUAGE_TABLE;

-- =====================================================================================
-- END OF SAMPLE DATA INSERTION
-- =====================================================================================
-- This script has successfully populated all three SAP S/4HANA data product databases
-- with realistic sample data based on existing data patterns.
-- =====================================================================================
