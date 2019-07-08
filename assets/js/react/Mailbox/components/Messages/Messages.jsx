import React, { useState, useEffect, Fragment } from 'react';
import axios from 'axios';
import _ from 'underscore';
import Routing from '../../../../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js';

// COMPONENTS
import { Form, Image, List, Message } from 'semantic-ui-react';

// CSS
import './Messages.css';

function Messages(props) {
  const [allMessages, setAllMessages] = useState([]);
  const [convs, setConvs] = useState([]);
  const [messages, setMessages] = useState([]);

  // if(props.userType=="client"){
  //   const noUserType='agency'
  // } else {
  //   const noUserType='client'
  // }

  useEffect(() => {
    getAllMessages();
    document.getElementById('bottom').scrollIntoView({ behavior: 'smooth', block: 'end'});
  }, []);

  const getAllMessages = async () => {
    let response = await axios.get(Routing.generate('api_messages', {'user': props.userType , 'id': props.userId }));
    setAllMessages(response.data.sort(function(a,b) { 
             return new Date(a.sendAt).getTime() - new Date(b.sendAt).getTime() 
       }));
    setConvs(_.uniq(response.data.map((e) => e.agency), obj => obj.id));
    setMessages(response.data.filter(e => e.admin));
  };

  const handleConv = (people) => {
    if (people=='admin'){
      setMessages(allMessages.filter(e => e.admin));
    } else {
      setMessages(allMessages.filter(e => e.agency.id==people && !e.admin))
    }
    document.getElementById('bottom').scrollIntoView({ behavior: 'smooth', block: 'end'});
  }

  state = {}

  handleChange = (e, { name, value }) => this.setState({ [name]: value })

  handleSubmit = () => this.setState({ name: '' })

  return (
    <Fragment>
      <div className="Conversations">
        <List selection verticalAlign='middle'>
          <List.Item onClick={() => handleConv('admin')}>
            <Image avatar src='../../../../../images/small-logo.png' />
            <List.Content>
              <List.Header>admin</List.Header>
            </List.Content>
          </List.Item>
          { convs.map((e) => {
              return (
                <List.Item onClick={() => handleConv(e.id)}>
                  <Image avatar src={e.picture} />
                  <List.Content>
                    <List.Header>agence: {e.company}</List.Header>
                  </List.Content>
                </List.Item>
              );
            })
          }
        </List>
      </div>
      <div className="Messages">
          { messages.map((e) => {
              return (
                <Message>
                  <p>{e.content}</p>
                  <small>{e.sendAt}</small>
                </Message>
          )})}
          <Form onSubmit={this.handleSubmit}>
            <Form.Group>
              <Form.Input placeholder='Ecrire qqch...' name='name' value={name} onChange={this.handleChange} />
              <Form.Button content='Submit' />
            </Form.Group>
          </Form>
          <div id="bottom"></div>
      </div>
    </Fragment>
  )
}

export default Messages;
