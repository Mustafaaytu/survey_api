# README

This survey api created for Pisano Company's technical interview.

On this api user can:

* User can answers the question with options or directory text format.

* From ```GET /survey/:id``` can see survey details.
* From ```POST /survey/:survey_id``` can create new Feedback from survey questions.
* Also Feedback contains a Response for each Question.

POST params should be like this;

```js
params: {
	feedback: {
		responses_attributes: [
			{
				question_id: :question_id,
				option_id: :option_id,
			},
			{
				question_id: :question_id,
				body: :body
			
			}
		]
		
	}
	
}
```

### Deploying app on docker
```sh
 docker-compose run web rake db:create
 docker-compose run web rake db:migrate
 docker-compose run web rake db:seed
 docker-compose run web rake test
 docker-compose up
```
