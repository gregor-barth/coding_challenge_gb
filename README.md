# README

Setup:
For the basic setup run the following commands:
* bundle install
* rake db:reseed

How to test the endpoint:<br>
First, start the rails server via the 'rails s' command.

You can access the endpoint in your browser or with a program like postman via:<br>
http://localhost:3000/api/v1/partners

In the request  parameters you can specify one or multiple services, separated by comma.<br>
?service=carpet, wood<br>
The coordinates have to specified as latitude and longitude in regular decimal numbers<br>
&lat=52.509232<br>
&lon=13.375840

Optional parameters are the floor area and the phone number:<br>
&floor_area=100<br>
&phone=030123456

Example call:<br>
http://localhost:3000/api/v1/partners?service=carpet,%20wood&lat=52.509232&lon=13.375840&floor_area=100&phone=030123456
