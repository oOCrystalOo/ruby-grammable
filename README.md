# Grammable

An Instagram clone that was built using industry-standard, test-driven development following numerous red/green/refactor cycles.
Functional project can be viewed on http://grammable-crystal-ng.herokuapp.com

## Setup
1. Clone the repository:
``` 
git clone https://github.com/oOCrystalOo/ruby-grammable.git
cd ruby-grammable
```
	
2. Install bundle, create a database, and run migration
``` 
bundle install
rake db:create
rake db:migrate
```

3. Set up an Amazon S3 storage
Set up a S3 bucket with Amazon Web Services. You will need to set up an IAM user with the `AmazonS3FullAccess` permissions. 
When launching your project, you will need to set the environment variables `AWS_ACCESS_KEY` and `AWS_SECRET_KEY`, which will be provided in the credentials.cvs that was downloaded when the IAM user was created.
You will also need to enter the enviroment variables `AWS_BUCKET` and `AWS_REGION`.
	
### Notes
This project uses postresql, and was created with ruby 2.5.3 and Rails 5.2.3.
Original project was deployed on Heroku.