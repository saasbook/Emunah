# README

[![Code Climate](https://codeclimate.com/github/Justinzh1/Emunah/badges/gpa.svg)](https://codeclimate.com/github/Justinzh1/Emunah)

[![Test Coverage](https://codeclimate.com/github/Justinzh1/Emunah/badges/coverage.svg)](https://codeclimate.com/github/Justinzh1/Emunah/coverage)

[![Build Status](https://travis-ci.org/Justinzh1/Emunah.svg?branch=master)](https://travis-ci.org/Justinzh1/Emunah)

Pivotal Tracker: https://www.pivotaltracker.com/n/projects/2117630

Heroku: http://enigmatic-mesa-26908.herokuapp.com

## Customer Website
https://www.bnaiemunahsf.org/

## Customer Needs

Each person who is given a login will have access to information based on their security clearance.  Database can be accessed by individuals with a two levels of security.  One for basic access (everyone who is tasked to gather and use information) and one for confidential access (only visible by rabbi, administrator, concierge, president and head of membership committee. 

Each family/individual can be coded as new/outreach member, longtime member, non member, prospective, Friend of BE, ex member, or deceased. 

When you login, you have access to Five Areas.

1) Submittals

2) Follow up items assigned to you

3) Search Database by Date (all entries between particular dates)

4) Search Database by Family

5) Lists of Families by Category

## App Set-up

1) Clone or fork the repo
2) Go to your designating Github working directory 
3) bundle install --without production
4) rake db:setup
5) rake db:seed                                           # populate the database

rails s                                                   # start the server
rake cucumber                                             # run features / BDDs
rake rspec                                                # run tests / TDDs

## Administrative .
- Check out the db/seed.rb for dummy data.
- Casey Takeda, Justin Zhong, Wayne Li, Tina Zheng, Peter Lee, Wesley Wan

## Models / Associations
- Many to Many Association with Users and Tasks
- One to Many from Family to People
- One to Many from Family to Submittals
