import React, { useState, useEffect, Fragment } from 'react';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Card } from 'semantic-ui-react';

// CSS
import './Steps.css';

function Steps() {
  const [steps, setSteps] = useState([]);
  const [mySteps, setMySteps] = useState([]);

  useEffect(() => {
    fetch(Routing.generate('api'))
      .then(res => res.json())
      .then(data => setSteps(data))
      .then(() => console.log('data fetched.'));
  }, []);

  const addStep = index => setMySteps([...mySteps, steps.splice(index, 1)[0]]);

  const removeStep = index => setSteps([...steps, mySteps.splice(index, 1)[0]]);

  return (
    <Fragment>
      <div className="Steps">
        <Card.Group centered>
          {
            steps.map((step, index) => {
              return (
                <Card key={index} onClick={() => addStep(index)}>
                  <Card.Content>
                    <Card.Header>{step.destination}</Card.Header>
                    <Card.Meta>{step.duration} jours</Card.Meta>
                    <Card.Description>{step.nameStage}</Card.Description>
                  </Card.Content>
                </Card>
              );
            })
          }
        </Card.Group>
      </div>
      <div className="ListSteps">
        <Card.Group centered>
          {
            mySteps.map((step, index) => {
              return (
                <Card key={index} fluid onClick={() => removeStep(index)}>
                  <Card.Content>
                    <Card.Header>{step.destination}</Card.Header>
                    <Card.Meta>{step.duration} jours</Card.Meta>
                    <Card.Description>{step.nameStage}</Card.Description>
                  </Card.Content>
                </Card>
              );
            })
          }
        </Card.Group>
      </div>
    </Fragment>
  )
}

export default Steps;