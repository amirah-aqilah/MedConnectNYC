<p align="center">
  <img src="github_banner.png" width="100%" />
</p>

<p align="center">

  <img src="https://img.shields.io/badge/Python-3.10-blue" />
  <img src="https://img.shields.io/badge/Framework-Flask-green" />
  <img src="https://img.shields.io/badge/Database-PostgreSQL-blue" />
  <img src="https://img.shields.io/badge/NoSQL-MongoDB-brightgreen" />
  <img src="https://img.shields.io/badge/Data-Google_Maps_API-red" />
  <img src="https://img.shields.io/badge/Data-NPI_Registry-orange" />
  <img src="https://img.shields.io/badge/Data-FDA_Open_Data-yellow" />
  <img src="https://img.shields.io/badge/License-MIT-lightgray" />

</p>

# **MedConnectNYC**

MedConnectNYC is a healthcare service demo built with **Flask**, **PostgreSQL**, and **MongoDB**.  
It simulates three core healthcare modules:

- **Emergency**
- **Consultation (In-Person + Telemedicine)**
- **Pharmacy**

API datasets (Google Maps, NPI Registry, FDA Open Data) are exported to **CSV** and stored inside **PostgreSQL**.  
Unstructured user communication (emergency messages, telemedicine notes) is stored in **MongoDB**.

This project demonstrates API ingestion, CSV workflows, relational and NoSQL databases, and a simple Flask UI.

---

# 🚑 **1. Features Overview**

### **Emergency**
- Shows nearest hospitals from NYC.
- Google Maps API → CSV → PostgreSQL.
- Demo returns top hospitals sorted by distance.

### **Consultation**
Supports two options:
1. **In-Person Consultation**  
2. **Telemedicine Consultation**

Doctors retrieved from NPI Registry → CSV → PostgreSQL.

### **Pharmacy**
- Medicine lookup from FDA Open Data.
- Stored as CSV → PostgreSQL.
- Includes basic ordering flow.

### **Unstructured Data (MongoDB)**
Stored:
- emergency messages  
- telemedicine session notes  
- raw logs  
- JSON responses  
