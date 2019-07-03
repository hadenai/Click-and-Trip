import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Card, Button } from 'semantic-ui-react';

// CSS
import './Steps.css';

function Steps() {
  const [steps, setSteps] = useState([]);
  const [mySteps, setMySteps] = useState([]);

  useEffect(() => {
    if (sessionStorage.getItem('steps') && JSON.parse(sessionStorage.getItem('mySteps')).length > 0) {
      setSteps(JSON.parse(sessionStorage.getItem('steps')));
      setMySteps(JSON.parse(sessionStorage.getItem('mySteps')));
    } else {
      getSteps();
    }
  }, []);

  const getSteps = async () => {
    let response = await axios.get(Routing.generate('api'));
    setSteps(response.data);
  };

  const addStep = (index) => {
    let selectedStep = steps.splice(index, 1)[0];
    setMySteps([...mySteps, selectedStep]);
    setSteps(filterStepsByReference(selectedStep, steps));

    sessionStorage.setItem('mySteps', JSON.stringify([...mySteps, selectedStep]));
    sessionStorage.setItem('steps', JSON.stringify(filterStepsByReference(selectedStep, steps)));
  };

  const removeStep = (index) => {
    let newSteps = [...steps, mySteps.splice(index, 1)[0]];
    setSteps(newSteps);

    sessionStorage.setItem('mySteps', JSON.stringify(mySteps));
    sessionStorage.setItem('steps', JSON.stringify(newSteps));

    mySteps.length === 0 && getSteps();
  };

  const validateTrip = () => {
    axios.post(Routing.generate('details'), JSON.stringify(mySteps));
    // window.location.href(Routing.generate('route'));
  };

  const filterStepsByReference = (step, list) => {
    let reference = step.reference.split('-');
    let filteredSteps = list.filter(step => {
      return step.reference.split('-')[0] === reference[0] && step.reference.split('-')[1] === reference[1];
    });
    return filteredSteps;
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
        {
          mySteps.length > 0
          && <Button className="validateButton" color="green" fluid onClick={validateTrip}>Valider mon voyage</Button>
        }
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