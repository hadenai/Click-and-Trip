import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Card, Button, Select } from 'semantic-ui-react';

// CSS
import './Steps.css';

function Steps() {
  const [steps, setSteps] = useState([]);
  const [stepsCopy, setStepsCopy] = useState([]);
  const [mySteps, setMySteps] = useState([]);
  const [currentStep, setCurrentStep] = useState({});

  const baseOptions = { key: 'Voir tout', value: 'Voir tout', text: 'Voir tout' };
  const [destinationOptions, setDestinationOptions] = useState([]);
  const [themeOptions, setThemeOptions] = useState([]);
  const [styleOptions, setStyleOptions] = useState([]);
  const [sizeOptions, setSizeOptions] = useState([]);
  const [agencyOptions, setAgencyOptions] = useState([]);

  let [filters, setFilters] = useState([
    { type: 'destination', name: 'Voir tout' },
    { type: 'theme', name: 'Voir tout' },
    { type: 'style', name: 'Voir tout' },
    { type: 'size', name: 'Voir tout' },
    { type: 'agency', name: 'Voir tout' }
  ]);
  const [filterResult, setFilterResult] = useState([]);

  useEffect(() => {
    getSteps();
  }, []);

  useEffect(() => {
    if (stepsCopy.length > 0) {
      let temp = [...stepsCopy];
      filters.forEach(filter => {
        switch (filter.type) {
          case 'destination':
            if (filter.name === 'Voir tout') {
              setFilterResult(temp);
            } else {
              temp = temp.filter(step => {
                return filter.name === step.destination
              });
              setFilterResult(temp);
            }
            break;
          case 'theme':
            if (filter.name === 'Voir tout') {
              setFilterResult(temp);
            } else {
              let tmp = [];
              temp.forEach(step => {
                step.themes.forEach(theme => {
                  if (filter.name === theme.theme) {
                    tmp = [...tmp, step];
                    temp = tmp;
                  } else if (filter.name !== theme.theme) {
                    temp = tmp;
                    setFilterResult(temp);
                  }
                });
              });
              setFilterResult(temp);
            }
            break;
          case 'style':
            if (filter.name === 'Voir tout') {
              setFilterResult(temp);
            } else {
              let tmp = [];
              temp.forEach(step => {
                step.styles.forEach(style => {
                  if (filter.name === style.style) {
                    tmp = [...tmp, step];
                    temp = tmp;
                  } else if (filter.name !== style.style) {
                    temp = tmp;
                  }
                  setFilterResult(temp);
                });
              });
              setFilterResult(temp);
            }
            break;
          case 'size':
            if (filter.name === 'Voir tout') {
              setFilterResult(temp);
            } else {
              let tmp = [];
              temp.forEach(step => {
                step.sizes.forEach(size => {
                  if (filter.name === size.people) {
                    tmp = [...tmp, step];
                    temp = tmp;
                  } else if (filter.name !== size.people) {
                    temp = tmp;
                  }
                  setFilterResult(temp);
                });
              });
              setFilterResult(temp);
            }
            break;
          case 'agency':
            if (filter.name === 'Voir tout') {
              setFilterResult(temp);
            } else {
              temp = temp.filter(step => {
                return filter.name === step.agency.company
              }).filter(step => {
                return currentStep.reference !== step.reference;
              });
              setFilterResult(temp);
            }
            break;
          default:
            setFilterResult(temp);
        }
      });
    }
  }, [filters, stepsCopy]);

  const getSteps = async () => {
    let response = await axios.get(Routing.generate('api'));
    setSteps(response.data);
    setStepsCopy(response.data);

    let fetchedDestOptions = _.uniq(response.data.map(step => {
      return step.destination;
    }))
      .map(destination => {
        return (
          { key: destination, value: destination, text: destination }
        )
      });

    let fetchedThemeOptions = [];
    response.data.forEach(step => {
      step.themes.forEach(theme => {
        fetchedThemeOptions.push(theme.theme);
      })
    });
    fetchedThemeOptions = _.uniq(fetchedThemeOptions).map(theme => {
      return (
        { key: theme, value: theme, text: theme }
      )
    });

    let fetchedStyleOptions = [];
    response.data.forEach(step => {
      step.styles.forEach(style => {
        fetchedStyleOptions.push(style.style);
      })
    });
    fetchedStyleOptions = _.uniq(fetchedStyleOptions).map(style => {
      return (
        { key: style, value: style, text: style }
      )
    });

    let fetchedSizeOptions = [];
    response.data.forEach(step => {
      step.sizes.forEach(size => {
        fetchedSizeOptions.push(size.people);
      })
    });
    fetchedSizeOptions = _.uniq(fetchedSizeOptions).map(size => {
      return (
        { key: size, value: size, text: size }
      )
    });

    let fetchedAgencyOptions = _.uniq(response.data.map(step => {
      return step.agency.company;
    }))
      .map(agency => {
        return (
          { key: agency, value: agency, text: agency }
        )
      });

    setDestinationOptions([baseOptions, ...fetchedDestOptions]);
    setThemeOptions([baseOptions, ...fetchedThemeOptions]);
    setStyleOptions([baseOptions, ...fetchedStyleOptions]);
    setSizeOptions([baseOptions, ...fetchedSizeOptions]);
    setAgencyOptions([baseOptions, ...fetchedAgencyOptions]);
  };

  const addStep = (index) => {
    let filterResultTmp = [...filterResult];
    let selectedStep = filterResultTmp.splice(index, 1)[0];
    setCurrentStep(selectedStep);
    setMySteps([...mySteps, selectedStep]);
    setFilterResult(filterResultTmp);
    filterSteps(4, selectedStep.agency.company);
  };

  const removeStep = (index) => {
    let myStepsTmp = [...mySteps];
    let selectedStep = myStepsTmp.splice(index, 1)[0];

    if (mySteps.length === 1) {
      filterSteps(4, 'Voir tout');
      setMySteps(myStepsTmp);
      setFilterResult([...filterResult, selectedStep]);
    } else {
      setMySteps(myStepsTmp);
      setFilterResult([...filterResult, selectedStep]);
    }
  };

  const filterSteps = (id, content) => {
    let newFilters = [...filters];
    newFilters[id].name = content;
    setFilters(newFilters);
  };

  const validateTrip = () => {
    console.table(mySteps);
    // axios.post(Routing.generate('details'), JSON.stringify(mySteps));
    // window.location.href(Routing.generate('route'));
  };

  return (
    <Fragment>
      <div className="Filters">
        <Select placeholder="Destination" options={destinationOptions} onChange={(e, { value }) => filterSteps(0, value)} />
        <Select placeholder="Theme" options={themeOptions} onChange={(e, { value }) => filterSteps(1, value)} />
        <Select placeholder="Style" options={styleOptions} onChange={(e, { value }) => filterSteps(2, value)} />
        <Select placeholder="Taille du groupe" options={sizeOptions} onChange={(e, { value }) => filterSteps(3, value)} />
        <Select placeholder="Agence" options={agencyOptions} onChange={(e, { value }) => filterSteps(4, value)} />
      </div>
      <div className="Steps">
        <Card.Group centered>
          {
            filterResult.map((step, index) => {
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
