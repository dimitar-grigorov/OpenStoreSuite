# OpenStoreSuite

## Introduction

OpenStoreSuite is an open-source Windows application designed to streamline sales management for small to medium-sized supermarkets and stores. OpenStoreSuite aims to enhance the operational efficiency of retail businesses through an intuitive and robust software solution.

## Tech Stack

* **Programming Language**: Delphi 7, 2007
* **Database**: Firebird

## Getting Started

(Instructions on how to install, configure, and run OpenStoreSuite will be placed here.)

## TODO

### Delphi and Firebird Project - Sales System - OpenStoreSuite

* [ ] Simple form with DBGrid and DataSource
* [ ] Create class AppSettings
  * [ ] Load and Save settings from/to file (OmniXML)
  * [ ] Database connection settings with encryption (AES) - maybe use mORMot, but try to find a simple solution
* [ ] Create interface IDBTools
  * [ ] Implement it in DataModule
* [ ] Create global Singleton class SQL Generator
* [ ] On start check if Firebird connection
  * [ ] If configuration is missing or invalid, show a form to configure
  * [ ] Check version of the database (create a table with version)
  * [ ] Create database structure if not exists.
  * [ ] Seed database with initial data
* [ ] Create a Base Dialog form
* [ ] Create a Base Frame wich will be used in all forms. (Notifier Refresh, etc)
* [ ] Create a Base Business Object class

## License

OpenStoreSuite is released under the [GPLv3](LICENSE.md). Feel free to fork and modify the repository as per your needs.
