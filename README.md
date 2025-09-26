# Periodic Table Database

A command-line application that provides detailed information about chemical elements from a PostgreSQL database.

## Project Overview

This project implements a bash script that queries a periodic table database to retrieve and display comprehensive information about chemical elements. Users can search for elements by atomic number, symbol, or name.

## Features

- **Flexible Search**: Find elements by atomic number, symbol, or name
- **Detailed Information**: Displays atomic number, name, symbol, type, atomic mass, melting point, and boiling point
- **Error Handling**: Provides clear error messages for invalid inputs or missing elements
- **Database-Backed**: Uses PostgreSQL for reliable data storage and retrieval

## Files

- `element.sh` - Main executable script for element lookup
- `periodic_table.sql` - Database dump containing the complete periodic table schema and data

## Usage

### Basic Usage
```bash
./element.sh [element_identifier]
```

### Examples
```bash
# Search by atomic number
./element.sh 1

# Search by symbol
./element.sh H

# Search by name
./element.sh Hydrogen

# Error handling
./element.sh
# Output: Please provide an element as an argument.

./element.sh XYZ
# Output: I could not find that element in the database.
```

### Expected Output
```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

## Database Schema

The database consists of three main tables:

- `elements` - Contains atomic number, symbol, and name
- `properties` - Contains physical properties and type reference
- `types` - Contains element classifications (metal, metalloid, nonmetal)

## Setup

### Restoring the Database
```bash
psql -U postgres < periodic_table.sql
```

### Making the Script Executable
```bash
chmod +x element.sh
```

## Requirements

- PostgreSQL database
- Bash shell
- `psql` command-line tool

## Project Structure

```
periodic_table/
├── element.sh              # Main executable script
├── periodic_table.sql      # Database dump file
└── README.md              # Project documentation
```

## Technical Details

- **Database Connection**: Uses `psql` with specific formatting flags for clean output
- **SQL Query**: Joins multiple tables to retrieve complete element information
- **Input Validation**: Checks for empty arguments and invalid element identifiers
- **Output Formatting**: Uses pipe-separated values and IFS for parsing database results

This project demonstrates database integration with shell scripting and proper error handling in a command-line application.