-- =====================================================================================
-- SAP S/4HANA Data Products - Complete Create Semantic Views
-- =====================================================================================
-- This file contains all logic to create semantic views in Snowflake
-- SAP S/4HANA data products: Sales Order, Customer, and Shipping Point

-- =====================================================================================
-- CREATE SEMANTIC VIEWS
-- =====================================================================================

-- SHIPPING_POINT_SEMANTIC_VIEW

USE DATABASE SAP_DATA_PRODUCT_SSP;
USE SCHEMA PUBLIC;

create or replace semantic view SHIPPING_POINT_SEMANTIC_VIEW
	tables (
		LANGUAGES as LANGUAGE_TABLE primary key (LANGUAGE_KEY),
		PLANTS as PLANT_TABLE primary key (PLANT_KEY),
		SHIPPING_POINTS as SHIPPING_POINT_TABLE primary key (SHIPPING_POINT,LANGUAGE),
		SHIPPING_POINT_MASTER as SHIPPING_POINT_MASTER_TABLE primary key (SHIPPING_POINT)
	)
	relationships (
		SHIPPING_POINTS(SHIPPING_POINT) references SHIPPING_POINT_MASTER(SHIPPING_POINT),
		SHIPPING_POINTS(LANGUAGE) references LANGUAGES(LANGUAGE_KEY),
		SHIPPING_POINT_MASTER(PLANT) references PLANTS(PLANT_KEY)
	)
	facts (
		LANGUAGES.LANGUAGE_NAME as language_name,
		PLANTS.COUNTRY as country,
		PLANTS.PLANT_NAME as plant_name,
		PLANTS.PLANT_TYPE as plant_type,
		PLANTS.REGION as region,
		SHIPPING_POINTS.LANGUAGE as language,
		SHIPPING_POINTS.SHIPPING_POINT as shipping_point,
		SHIPPING_POINTS.SHIPPING_POINT_NAME as shipping_point_name,
		SHIPPING_POINT_MASTER.PLANT as plant,
		SHIPPING_POINT_MASTER.SHIPPING_POINT_DESCRIPTION as shipping_point_description
	)
	dimensions (
		SHIPPING_POINT_MASTER.DELIVERY_PRIORITY as delivery_priority,
		SHIPPING_POINT_MASTER.LOADING_GROUP as loading_group,
		SHIPPING_POINT_MASTER.SHIPPING_CONDITION as shipping_condition,
		SHIPPING_POINT_MASTER.STORAGE_LOCATION as storage_location,
		SHIPPING_POINT_MASTER.TRANSPORTATION_GROUP as transportation_group
	)
	metrics (
		LANGUAGES.TOTAL_LANGUAGES as COUNT(DISTINCT languages.language_key),
		PLANTS.TOTAL_PLANTS as COUNT(DISTINCT plants.plant_key),
		SHIPPING_POINTS.TOTAL_SHIPPING_POINTS as COUNT(DISTINCT shipping_points.shipping_point),
		SHIPPING_POINTS.TOTAL_SHIPPING_POINT_TEXTS as COUNT(*),
		SHIPPING_POINT_MASTER.TOTAL_SHIPPING_POINT_MASTER as COUNT(DISTINCT shipping_point_master.shipping_point)
	)
	comment='Shipping Point Semantic View - Comprehensive business interface to SAP S/4HANA Shipping Point data.

This semantic view provides:
- Shipping point master data with multilingual descriptions
- Language-dependent text information
- Plant and organizational structure relationships
- Logistics and transportation configuration
- Geographic and regional information
- Relationships to all relevant master data entities

Designed for use with Cortex Analyst and standard SQL queries.
Based on I_ShippingPointText analytical dimension from SAP S/4HANA.

Usage:
  SELECT * FROM SEMANTIC_VIEW(shipping_point_semantic_view);

For Cortex Analyst natural language queries, reference this view in the REST API request.'
	with extension (CA='{"tables":[{"name":"LANGUAGES","facts":[{"name":"LANGUAGE_NAME"}],"metrics":[{"name":"TOTAL_LANGUAGES"}]},{"name":"PLANTS","facts":[{"name":"COUNTRY"},{"name":"PLANT_NAME"},{"name":"PLANT_TYPE"},{"name":"REGION"}],"metrics":[{"name":"TOTAL_PLANTS"}]},{"name":"SHIPPING_POINTS","facts":[{"name":"LANGUAGE"},{"name":"SHIPPING_POINT"},{"name":"SHIPPING_POINT_NAME"}],"metrics":[{"name":"TOTAL_SHIPPING_POINT_TEXTS"},{"name":"TOTAL_SHIPPING_POINTS"}]},{"name":"SHIPPING_POINT_MASTER","dimensions":[{"name":"DELIVERY_PRIORITY"},{"name":"LOADING_GROUP"},{"name":"SHIPPING_CONDITION"},{"name":"STORAGE_LOCATION"},{"name":"TRANSPORTATION_GROUP"}],"facts":[{"name":"PLANT"},{"name":"SHIPPING_POINT_DESCRIPTION"}],"metrics":[{"name":"TOTAL_SHIPPING_POINT_MASTER"}]}],"relationships":[{"name":"\\"SYS_RELATIONSHIP_0bfcfd7f-185f-4efb-841f-53d0429a4570\\""},{"name":"\\"SYS_RELATIONSHIP_e79e9e55-a3e9-41df-a0e2-38afeaacefc2\\""},{"name":"\\"SYS_RELATIONSHIP_31fda657-e56e-4fe1-82de-e6c855a952a6\\""}]}');

-- SALES_ORDER_SEMANTIC_VIEW

USE DATABASE SAP_DATA_PRODUCT_SALES_ORDER;
USE SCHEMA PUBLIC;

create or replace semantic view SALES_ORDER_SEMANTIC_VIEW
	tables (
		CUSTOMERS as CUSTOMER_TABLE primary key (CUSTOMER) comment='This table stores information about customers, including their unique identifier, name, and contact details such as city, country, postal code, and street address. It also captures the customer''s region and group affiliation, allowing for categorization and segmentation of customers for business purposes.',
		DISTRIBUTION_CHANNELS as DISTRIBUTION_CHANNEL_TABLE primary key (DISTRIBUTION_CHANNEL) comment='This table stores a list of unique distribution channels used by the organization, with a brief description for each channel. The distribution channel is identified by a two-character code, which serves as the primary key.',
		DIVISIONS as DIVISION_TABLE primary key (DIVISION) comment='This table stores a list of unique divisions within an organization, with a brief description of each division. The two-character division code serves as a unique identifier for each division.',
		MATERIALS as MATERIAL_TABLE primary key (MATERIAL) comment='This table stores information about materials used in a manufacturing or production process, including the material''s unique identifier, type, description, base unit of measurement, and material group classification.',
		SALES_ORDERS as SALES_ORDER_HEADER_TABLE primary key (SALES_ORDER) comment='This table stores information about sales orders, including the order details, customer information, order status, and organizational details. It captures key data points such as order date, requested delivery date, total net amount, and transaction currency, as well as the status of the sales order and the overall sales and distribution process.',
		SALES_ORDER_ITEMS as SALES_ORDER_ITEM_TABLE primary key (SALES_ORDER,SALES_ORDER_ITEM) comment='This table stores detailed information about individual items within a sales order, including the sales order number, item number, material description, quantity, unit of measurement, and net amount.',
		SALES_ORDER_TYPES as SALES_ORDER_TYPE_TABLE primary key (SALES_ORDER_TYPE) comment='This table stores the different types of sales orders that can be placed, with a unique identifier and a descriptive name for each type.',
		SALES_ORGANIZATIONS as SALES_ORGANIZATION_TABLE primary key (SALES_ORGANIZATION) comment='This table stores information about sales organizations within a company, including a unique identifier, the name of the sales organization, and the company code it belongs to, allowing for the management and tracking of sales activities across different organizational units.'
	)
	relationships (
		SALES_ORDERS(DIVISION) references DIVISIONS(DIVISION),
		SALES_ORDERS(SALES_ORGANIZATION) references SALES_ORGANIZATIONS(SALES_ORGANIZATION),
		SALES_ORDERS(DISTRIBUTION_CHANNEL) references DISTRIBUTION_CHANNELS(DISTRIBUTION_CHANNEL),
		SALES_ORDERS(SALES_ORDER_TYPE) references SALES_ORDER_TYPES(SALES_ORDER_TYPE),
		SALES_ORDERS(CUSTOMER) references CUSTOMERS(CUSTOMER),
		SALES_ORDER_ITEMS(SALES_ORDER) references SALES_ORDERS(SALES_ORDER),
		SALES_ORDER_ITEMS(MATERIAL) references MATERIALS(MATERIAL)
	)
	facts (
		CUSTOMERS.CITY as city,
		CUSTOMERS.COUNTRY as country,
		CUSTOMERS.CUSTOMER_GROUP as customer_group,
		CUSTOMERS.CUSTOMER_NAME as customer_name,
		CUSTOMERS.POSTAL_CODE as postal_code,
		CUSTOMERS.REGION as region,
		CUSTOMERS.STREET as street,
		DISTRIBUTION_CHANNELS.DISTRIBUTION_CHANNEL_NAME as distribution_channel_name,
		DIVISIONS.DIVISION_NAME as division_name,
		MATERIALS.BASE_UNIT as base_unit,
		MATERIALS.MATERIAL_DESCRIPTION as material_description,
		MATERIALS.MATERIAL_GROUP as material_group,
		MATERIALS.MATERIAL_TYPE as material_type,
		SALES_ORDERS.CUSTOMER as customer,
		SALES_ORDERS.OVERALL_SD_PROCESS_STATUS as overall_sd_process_status,
		SALES_ORDERS.REQUESTED_DELIVERY_DATE as requested_delivery_date,
		SALES_ORDERS.SALES_ORDER as sales_order,
		SALES_ORDERS.SALES_ORDER_DATE as sales_order_date,
		SALES_ORDERS.SALES_ORDER_STATUS as sales_order_status,
		SALES_ORDERS.TOTAL_NET_AMOUNT as total_net_amount,
		SALES_ORDERS.TRANSACTION_CURRENCY as transaction_currency,
		SALES_ORDER_ITEMS.MATERIAL as material,
		SALES_ORDER_ITEMS.NET_AMOUNT as net_amount,
		SALES_ORDER_ITEMS.SALES_ORDER_ITEM as sales_order_item,
		SALES_ORDER_ITEMS.SALES_ORDER_QUANTITY as sales_order_quantity,
		SALES_ORDER_ITEMS.SALES_ORDER_QUANTITY_UNIT as sales_order_quantity_unit,
		SALES_ORDER_TYPES.SALES_ORDER_TYPE_NAME as sales_order_type_name,
		SALES_ORGANIZATIONS.COMPANY_CODE as company_code,
		SALES_ORGANIZATIONS.SALES_ORGANIZATION_NAME as sales_organization_name
	)
	dimensions (
		SALES_ORDERS.DISTRIBUTION_CHANNEL as distribution_channel,
		SALES_ORDERS.DIVISION as division,
		SALES_ORDERS.SALES_ORDER_TYPE as sales_order_type,
		SALES_ORDERS.SALES_ORGANIZATION as sales_organization
	)
	metrics (
		DISTRIBUTION_CHANNELS.TOTAL_DISTRIBUTION_CHANNELS as COUNT(DISTINCT distribution_channels.distribution_channel),
		DIVISIONS.TOTAL_DIVISIONS as COUNT(DISTINCT divisions.division),
		SALES_ORDERS.TOTAL_CUSTOMERS as COUNT(DISTINCT sales_orders.customer),
		SALES_ORDERS.TOTAL_NET_AMOUNT_SUM as SUM(sales_orders.total_net_amount),
		SALES_ORDERS.TOTAL_SALES_ORDERS as COUNT(DISTINCT sales_orders.sales_order),
		SALES_ORDER_ITEMS.TOTAL_MATERIALS as COUNT(DISTINCT sales_order_items.material),
		SALES_ORDER_ITEMS.TOTAL_NET_AMOUNT_SUM as SUM(sales_order_items.net_amount),
		SALES_ORDER_ITEMS.TOTAL_QUANTITY_SUM as SUM(sales_order_items.sales_order_quantity),
		SALES_ORDER_ITEMS.TOTAL_SALES_ORDER_ITEMS as COUNT(*),
		SALES_ORDER_TYPES.TOTAL_SALES_ORDER_TYPES as COUNT(DISTINCT sales_order_types.sales_order_type),
		SALES_ORGANIZATIONS.TOTAL_SALES_ORGANIZATIONS as COUNT(DISTINCT sales_organizations.sales_organization)
	)
	comment='Sales Order Semantic View - Comprehensive business interface to SAP S/4HANA Sales Order data.

This semantic view provides:
- Complete sales order header and item information
- Customer master data with addresses and organizational structure
- Material master data with descriptions and classifications
- Sales organizational structure (sales org, distribution channel, division)
- Sales order types and status information
- Financial data with amounts and currencies
- Quantities and units of measure
- Relationships between all relevant master data entities

Key Business Capabilities:
- Sales order analysis and reporting
- Customer performance analysis
- Product/material performance tracking
- Sales organizational analysis
- Financial reporting and analytics
- Order fulfillment tracking
- Multi-currency support

Designed for use with:
- Cortex Analyst for natural language queries
- Standard SQL queries for reporting
- Business intelligence dashboards
- Data analytics tools

Based on I_SalesOrder analytical dimension from SAP S/4HANA.

Usage Examples:
  SELECT * FROM SEMANTIC_VIEW(sales_order_semantic_view DIMENSIONS sales_organization, division METRICS total_sales_orders, total_net_amount_sum);

  SELECT * FROM SEMANTIC_VIEW(sales_order_semantic_view DIMENSIONS customer, material METRICS total_net_amount_sum, total_quantity_sum);

For Cortex Analyst natural language queries, reference this view in the REST API request.'
	with extension (CA='{"tables":[{"name":"CUSTOMERS","facts":[{"name":"CITY"},{"name":"COUNTRY"},{"name":"CUSTOMER_GROUP"},{"name":"CUSTOMER_NAME"},{"name":"POSTAL_CODE"},{"name":"REGION"},{"name":"STREET"}]},{"name":"DISTRIBUTION_CHANNELS","facts":[{"name":"DISTRIBUTION_CHANNEL_NAME"}],"metrics":[{"name":"TOTAL_DISTRIBUTION_CHANNELS"}]},{"name":"DIVISIONS","facts":[{"name":"DIVISION_NAME"}],"metrics":[{"name":"TOTAL_DIVISIONS"}]},{"name":"MATERIALS","facts":[{"name":"BASE_UNIT"},{"name":"MATERIAL_DESCRIPTION"},{"name":"MATERIAL_GROUP"},{"name":"MATERIAL_TYPE"}]},{"name":"SALES_ORDERS","dimensions":[{"name":"DISTRIBUTION_CHANNEL"},{"name":"DIVISION"},{"name":"SALES_ORDER_TYPE"},{"name":"SALES_ORGANIZATION"}],"facts":[{"name":"CUSTOMER"},{"name":"OVERALL_SD_PROCESS_STATUS"},{"name":"REQUESTED_DELIVERY_DATE"},{"name":"SALES_ORDER"},{"name":"SALES_ORDER_DATE"},{"name":"SALES_ORDER_STATUS"},{"name":"TOTAL_NET_AMOUNT"},{"name":"TRANSACTION_CURRENCY"}],"metrics":[{"name":"TOTAL_CUSTOMERS"},{"name":"TOTAL_NET_AMOUNT_SUM"},{"name":"TOTAL_SALES_ORDERS"}]},{"name":"SALES_ORDER_ITEMS","facts":[{"name":"MATERIAL"},{"name":"NET_AMOUNT"},{"name":"SALES_ORDER_ITEM"},{"name":"SALES_ORDER_QUANTITY"},{"name":"SALES_ORDER_QUANTITY_UNIT"}],"metrics":[{"name":"TOTAL_MATERIALS"},{"name":"TOTAL_NET_AMOUNT_SUM"},{"name":"TOTAL_QUANTITY_SUM"},{"name":"TOTAL_SALES_ORDER_ITEMS"}]},{"name":"SALES_ORDER_TYPES","facts":[{"name":"SALES_ORDER_TYPE_NAME"}],"metrics":[{"name":"TOTAL_SALES_ORDER_TYPES"}]},{"name":"SALES_ORGANIZATIONS","facts":[{"name":"COMPANY_CODE"},{"name":"SALES_ORGANIZATION_NAME"}],"metrics":[{"name":"TOTAL_SALES_ORGANIZATIONS"}]}],"relationships":[{"name":"\\"SYS_RELATIONSHIP_0bf7305f-2442-492c-91a6-ae6ecc109033\\""},{"name":"\\"SYS_RELATIONSHIP_5ad53d30-764e-4f87-a032-6c7d0e293daf\\""},{"name":"\\"SYS_RELATIONSHIP_8f95b708-d204-49e7-9303-fe97a0d84b13\\""},{"name":"\\"SYS_RELATIONSHIP_e0df66a7-7a5a-405d-86ab-a9eda3a9e893\\""},{"name":"\\"SYS_RELATIONSHIP_e301fadc-be1d-4b3f-a39b-5ec4873696d1\\""},{"name":"\\"SYS_RELATIONSHIP_777eb5e2-2cbd-4ca9-9694-e58b525c2665\\""},{"name":"\\"SYS_RELATIONSHIP_b392ec6e-fcfe-48f6-a097-a6061a35196d\\""}]}');

-- CUSTOMER_SEMANTIC_VIEW
USE DATABASE SAP_DATA_PRODUCT_CUSTOMER;
USE SCHEMA PUBLIC;

create or replace semantic view CUSTOMER_SEMANTIC_VIEW
	tables (
		COUNTRIES as COUNTRY_TABLE primary key (COUNTRY) comment='This table stores master data for countries, including their ISO 3166-1 alpha-3 code, full name, region code, and official currency code, with timestamps for creation and last update.',
		CUSTOMERS as CUSTOMER_MASTER_TABLE primary key (CUSTOMER) comment='This table stores customer master data, including address information (city, country, postal code, street), organizational details (customer group, sales organization, distribution channel, division), and business information (customer status, customer type, industry sector, tax number).',
		CUSTOMER_GROUPS as CUSTOMER_GROUP_TABLE primary key (CUSTOMER_GROUP) comment='This table stores master data for customer groups, which are used for segmentation and analysis purposes, capturing key attributes such as group name and description, with automated tracking of creation and update timestamps.',
		DISTRIBUTION_CHANNELS as DISTRIBUTION_CHANNEL_TABLE primary key (DISTRIBUTION_CHANNEL) comment='This table stores master data for different distribution channels, providing a centralized repository for sales channel analysis. It captures the unique identifier and name of each distribution channel, along with timestamps for when the record was created and last updated.',
		DIVISIONS as DIVISION_TABLE primary key (DIVISION) comment='This table stores the master data for divisions, which are used to categorize and analyze product lines. It contains a unique identifier for each division, a descriptive name, and timestamps for when the record was created and last updated.',
		SALES_ORGANIZATIONS as SALES_ORGANIZATION_TABLE primary key (SALES_ORGANIZATION) comment='This table stores master data for sales organizations, capturing the unique identifier, name, and associated company code for each sales organization, with automated timestamp tracking for creation and updates.'
	)
	relationships (
		CUSTOMERS(SALES_ORGANIZATION) references SALES_ORGANIZATIONS(SALES_ORGANIZATION),
		CUSTOMERS(DIVISION) references DIVISIONS(DIVISION),
		CUSTOMERS(DISTRIBUTION_CHANNEL) references DISTRIBUTION_CHANNELS(DISTRIBUTION_CHANNEL),
		CUSTOMERS(CUSTOMER_GROUP) references CUSTOMER_GROUPS(CUSTOMER_GROUP),
		CUSTOMERS(COUNTRY) references COUNTRIES(COUNTRY)
	)
	facts (
		COUNTRIES.COUNTRY_NAME as country_name,
		COUNTRIES.CURRENCY as currency,
		CUSTOMERS.CITY as city,
		CUSTOMERS.COUNTRY as country,
		CUSTOMERS.CUSTOMER as customer,
		CUSTOMERS.CUSTOMER_GROUP as customer_group,
		CUSTOMERS.CUSTOMER_NAME as customer_name,
		CUSTOMERS.CUSTOMER_STATUS as customer_status,
		CUSTOMERS.CUSTOMER_TYPE as customer_type,
		CUSTOMERS.DISTRIBUTION_CHANNEL as distribution_channel,
		CUSTOMERS.DIVISION as division,
		CUSTOMERS.INDUSTRY_SECTOR as industry_sector,
		CUSTOMERS.POSTAL_CODE as postal_code,
		CUSTOMERS.REGION as region,
		CUSTOMERS.SALES_ORGANIZATION as sales_organization,
		CUSTOMERS.STREET as street,
		CUSTOMERS.TAX_NUMBER as tax_number,
		CUSTOMER_GROUPS.CUSTOMER_GROUP_DESCRIPTION as customer_group_description,
		CUSTOMER_GROUPS.CUSTOMER_GROUP_NAME as customer_group_name,
		DISTRIBUTION_CHANNELS.DISTRIBUTION_CHANNEL_NAME as distribution_channel_name,
		DIVISIONS.DIVISION_NAME as division_name,
		SALES_ORGANIZATIONS.COMPANY_CODE as company_code,
		SALES_ORGANIZATIONS.SALES_ORGANIZATION_NAME as sales_organization_name
	)
	dimensions (
		COUNTRIES.COUNTRY as country comment='Country of origin, representing the three-letter ISO code for the country where a transaction or entity is located.',
		CUSTOMER_GROUPS.CUSTOMER_GROUP as customer_group comment='Customer group classification, categorizing customers into distinct segments for targeted marketing, sales, and service strategies.',
		DISTRIBUTION_CHANNELS.DISTRIBUTION_CHANNEL as distribution_channel comment='Distribution Channel represents the method or platform through which a product or service is delivered to the end customer, with possible values including: 
01 - Direct Sales, 
02 - Indirect Sales, and 
05 - Online Sales.',
		DIVISIONS.DIVISION as division comment='Division identifier, a unique two-digit code representing a specific business division within the organization.',
		SALES_ORGANIZATIONS.SALES_ORGANIZATION as sales_organization comment='Unique identifier for the sales organization responsible for managing sales activities and processes.'
	)
	metrics (
		COUNTRIES.TOTAL_COUNTRIES as COUNT(DISTINCT countries.country),
		CUSTOMERS.TOTAL_CUSTOMERS as COUNT(DISTINCT customers.customer),
		CUSTOMER_GROUPS.TOTAL_CUSTOMER_GROUPS as COUNT(DISTINCT customer_groups.customer_group),
		DISTRIBUTION_CHANNELS.TOTAL_DISTRIBUTION_CHANNELS as COUNT(DISTINCT distribution_channels.distribution_channel),
		DIVISIONS.TOTAL_DIVISIONS as COUNT(DISTINCT divisions.division),
		SALES_ORGANIZATIONS.TOTAL_SALES_ORGANIZATIONS as COUNT(DISTINCT sales_organizations.sales_organization)
	)
	comment='Customer Semantic View - Complete implementation based on I_Customer analytical dimension from SAP S/4HANA.

This semantic view is structured exactly according to the sap-s4com-Customer-v1-formatted.json file:

Key Elements from JSON:
- Customer: 10-character customer number (key)
- CustomerName: 35-character customer name
- City: 35-character city name
- Country: 3-character country code
- PostalCode: 10-character postal code
- Street: 60-character street address
- Region: 3-character region code
- CustomerGroup: 2-character customer group
- SalesOrganization: 4-character sales organization
- DistributionChannel: 2-character distribution channel
- Division: 2-character division

Entity Properties from JSON:
- @Analytics.dataCategory: DIMENSION
- @ObjectModel.usageType.sizeCategory: S
- @AccessControl.authorizationCheck: NOT_REQUIRED
- @EntityRelationship.entityType: sap.vdm.sont:Customer

Multilingual Support (10 languages):
- English (en): "Customer"
- German (de): "Kunde"
- French (fr): "Client"
- Spanish (es): "Cliente"
- Italian (it): "Cliente"
- Japanese (ja): "顧客"
- Korean (ko): "고객"
- Chinese (zh): "客户"
- Arabic (ar): "العميل"
- Russian (ru): "Клиент"

Usage Examples:
  SELECT * FROM SEMANTIC_VIEW(customer_semantic_view DIMENSIONS customer_group METRICS total_customers);

  SELECT * FROM SEMANTIC_VIEW(customer_semantic_view DIMENSIONS country METRICS total_customers, total_countries);

  SELECT * FROM SEMANTIC_VIEW(customer_semantic_view DIMENSIONS customer_group, sales_organization METRICS total_customers, total_customer_groups);

For Cortex Analyst natural language queries, reference this view in the REST API request.'
	with extension (CA='{"tables":[{"name":"COUNTRIES","dimensions":[{"name":"COUNTRY","sample_values":["US","DE","GB"]}],"facts":[{"name":"COUNTRY_NAME"},{"name":"CURRENCY"}],"metrics":[{"name":"TOTAL_COUNTRIES"}]},{"name":"CUSTOMERS","facts":[{"name":"CITY"},{"name":"COUNTRY"},{"name":"CUSTOMER"},{"name":"CUSTOMER_GROUP"},{"name":"CUSTOMER_NAME"},{"name":"CUSTOMER_STATUS"},{"name":"CUSTOMER_TYPE"},{"name":"DISTRIBUTION_CHANNEL"},{"name":"DIVISION"},{"name":"INDUSTRY_SECTOR"},{"name":"POSTAL_CODE"},{"name":"REGION"},{"name":"SALES_ORGANIZATION"},{"name":"STREET"},{"name":"TAX_NUMBER"}],"metrics":[{"name":"TOTAL_CUSTOMERS"}]},{"name":"CUSTOMER_GROUPS","dimensions":[{"name":"CUSTOMER_GROUP","sample_values":["01","02","05"]}],"facts":[{"name":"CUSTOMER_GROUP_DESCRIPTION"},{"name":"CUSTOMER_GROUP_NAME"}],"metrics":[{"name":"TOTAL_CUSTOMER_GROUPS"}]},{"name":"DISTRIBUTION_CHANNELS","dimensions":[{"name":"DISTRIBUTION_CHANNEL","sample_values":["01","02","05"]}],"facts":[{"name":"DISTRIBUTION_CHANNEL_NAME"}],"metrics":[{"name":"TOTAL_DISTRIBUTION_CHANNELS"}]},{"name":"DIVISIONS","dimensions":[{"name":"DIVISION","sample_values":["01","02","05"]}],"facts":[{"name":"DIVISION_NAME"}],"metrics":[{"name":"TOTAL_DIVISIONS"}]},{"name":"SALES_ORGANIZATIONS","dimensions":[{"name":"SALES_ORGANIZATION","sample_values":["0003","0001","0002"]}],"facts":[{"name":"COMPANY_CODE"},{"name":"SALES_ORGANIZATION_NAME"}],"metrics":[{"name":"TOTAL_SALES_ORGANIZATIONS"}]}],"relationships":[{"name":"\\"SYS_RELATIONSHIP_1d8dff2e-4259-4e70-9d35-0f6bc0f9c008\\""},{"name":"\\"SYS_RELATIONSHIP_5ba11d09-2b1b-4266-b509-d0667b4a2d4c\\""},{"name":"\\"SYS_RELATIONSHIP_91ef9b50-7008-4bd3-abc6-bbd6aa61137a\\""},{"name":"\\"SYS_RELATIONSHIP_c9b71d63-c697-41a6-80dd-ea5b018689f4\\""},{"name":"\\"SYS_RELATIONSHIP_ecfaac93-da43-4484-b165-12cdee8e97f8\\""}]}');