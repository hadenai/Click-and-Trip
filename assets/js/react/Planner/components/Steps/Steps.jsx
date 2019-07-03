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
    if (localStorage.getItem('steps') && JSON.parse(localStorage.getItem('mySteps')).length > 0) {
      setSteps(JSON.parse(localStorage.getItem('steps')));
      setMySteps(JSON.parse(localStorage.getItem('mySteps')));
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

    localStorage.setItem('mySteps', JSON.stringify([...mySteps, selectedStep]));
    localStorage.setItem('steps', JSON.stringify(filterStepsByReference(selectedStep, steps)));
  };

  const removeStep = (index) => {
    let newSteps = [...steps, mySteps.splice(index, 1)[0]];
    setSteps(newSteps);

    localStorage.setItem('mySteps', JSON.stringify(mySteps));
    localStorage.setItem('steps', JSON.stringify(newSteps));

    mySteps.length === 0 && getSteps();
  };

  const validateTrip = () => {
    console.table(mySteps);
    axios.post(Routing.generate('jsonsteps'), JSON.stringify(mySteps));
    window.location=Routing.generate('success');
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