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
    getData();
  }, []);

  const getData = () => {
    fetch(Routing.generate('api'))
    .then(res => res.json())
    .then(data => setSteps(data));
  };

  const addStep = (index) => {
    let selectedStep = steps.splice(index, 1)[0];
    setMySteps([...mySteps, selectedStep]);
    filterByReference(selectedStep);
  };

  const removeStep = (index) => {
    setSteps([...steps, mySteps.splice(index, 1)[0]]);
    mySteps.length === 0 && getData();
  };

  const filterByReference = (step) => {
    let reference = step.reference.split('-');
    let filteredSteps = steps.filter(step => {
      return step.reference.split('-')[0] == reference[0] && step.reference.split('-')[1] == reference[1];
    });
    setSteps(filteredSteps);
  };
  

  return (
    <Fragment>
      <div className="Steps">
        <Card.Group centered>
          {
            steps.map((step, index) => {
              return (
                <Card key={index} color="green" onClick={() => addStep(index)}>
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
                <Card key={index} fluid color="red" onClick={() => removeStep(index)}>
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