# DBT – Snowflake Music Exam

## Objectif
Migration des requêtes SQL Snowflake vers dbt :
- déclaration des sources
- modèles staging
- schéma en étoile
- vues de requêtes d’analyse

## Structure
- models/sources : sources Snowflake
- models/staging : nettoyage / renommage
- models/marts/star : schéma en étoile
- models/exam_queries : vues correspondant aux questions 3.1 à 3.11

## Exécution
dbt run
dbt test
dbt run --select tag:exam_queries
