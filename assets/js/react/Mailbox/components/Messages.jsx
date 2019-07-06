import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Card, Button, Select } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages() {
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    getMessages();
  }, []);

  useEffect(() => {
    if (messagesCopy.length > 0) {
      let temp = [...messagesCopy];
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
                  }
                })
              })
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
                  }
                })
              })
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
                  }
                })
              })
              setFilterResult(temp);
            }
            break;
          default:
            setFilterResult(temp);
        }
      });
    }
  }, [filters, messagesCopy]);

  const getMessages = async () => {
    let response = await axios.get(Routing.generate('api'));
    setMessages(response.data);
    setMessagesCopy(response.data);

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

    setDestinationOptions([baseOptions, ...fetchedDestOptions]);
    setThemeOptions([baseOptions, ...fetchedThemeOptions]);
    setStyleOptions([baseOptions, ...fetchedStyleOptions]);
    setSizeOptions([baseOptions, ...fetchedSizeOptions]);
  };

  const addStep = (index) => {
    let selectedStep = messagesCopy.splice(index, 1)[0];

    setMyMessages([...myMessages, selectedStep]);
    // setMessagesCopy(filterMessagesByReference(selectedStep, messagesCopy));
  };

  const removeStep = (index) => {
    let newMessages = [...messagesCopy, myMessages.splice(index, 1)[0]];
    setMessagesCopy(newMessages);

    myMessages.length === 0 && setMessagesCopy([...messages]);
  };

  const validateTrip = () => {
    axios.post(Routing.generate('details'), JSON.stringify(myMessages));
    // window.location.href(Routing.generate('route'));
  };

  const filterMessagesByDestination = (content) => {
    let newFilters = [...filters];
    newFilters[0].name = content;
    setFilters(newFilters);
  };

  const filterMessagesByTheme = (content) => {
    let newFilters = [...filters];
    newFilters[1].name = content;
    setFilters(newFilters);
  };

  const filterMessagesByStyle = (content) => {
    let newFilters = [...filters];
    newFilters[2].name = content;
    setFilters(newFilters);
  };

  const filterMessagesBySize = (content) => {
    let newFilters = [...filters];
    newFilters[3].name = content;
    setFilters(newFilters);
  };

  // const filterMessagesByReference = (step, list) => {
  //   let reference = step.reference.split('-');
  //   let filteredMessages = list.filter(step => {
  //     return step.reference.split('-')[0] === reference[0] && step.reference.split('-')[1] === reference[1];
  //   });
  //   return filteredMessages;
  // };

  return (
    <Fragment>
      <div className="Filters">
        <Select placeholder="Destination" options={destinationOptions} onChange={(e, { value }) => filterMessagesByDestination(value)} />
        <Select placeholder="Theme" options={themeOptions} onChange={(e, { value }) => filterMessagesByTheme(value)} />
        <Select placeholder="Style" options={styleOptions} onChange={(e, { value }) => filterMessagesByStyle(value)} />
        <Select placeholder="Taille du groupe" options={sizeOptions} onChange={(e, { value }) => filterMessagesBySize(value)} />
      </div>
      <div className="Messages">
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
      <div className="ListMessages">
        {
          myMessages.length > 0
          && <Button className="validateButton" color="green" fluid onClick={validateTrip}>Valider mon voyage</Button>
        }
        <Card.Group centered>
          {
            myMessages.map((step, index) => {
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

export default Messages;
