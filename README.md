# TaskSoup

TaskSoup is a compact (about 500 lines of code) scrum-like (but not entirely Scrum) planning tool.

Website

http://schuttelaar.github.io/tasksoup

## Features

* Multiple (Scrum) teams
* Teams can share members
* Variable length periods
* Task overview per team
* Highlights for high priority tasks and due dates
* ChartJS based burndown chart to visualize progress
* Calculates focus factor / efficiency over time
* Easy to move or copy tasks between periods or teams
* Export to HTML or XLS
* Highlight tasks per person or customer by clicking on person/customer
* Multiple members can be assigned to task
* Easy skinnable thanks to StampTE template Engine
...and many, many more features, in just about 500-600 relatively short lines of PHP code.

## Requirements

* PHP 5.3.3+
* Webserver (Apache)
* SQLite

## Installing

Just download the tarball and extract it.
Run the create_database.sh script to import the schema into your database.

That's all.

## Upgrading

Just pull the next release, find the line that sets up the database, which looks something like this:

    R::setup( 'sqlite:database/data.sql', NULL, NULL, TRUE ); //<-- CONFIGURE YOUR DATABASE HERE

Change `TRUE` to `FALSE` to unfreeze the database, this way any new columns will be added automatically.
After a finished sprint you can always put it back for a better performance.

