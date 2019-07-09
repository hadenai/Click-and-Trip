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
  const [input, setInput] = useState('');

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

  const handleConv = (check) => {
    if (check=='admin'){
      setMessages(allMessages.filter(e => e.admin));
    } else {
      setMessages(allMessages.filter(e => e.agency.id==check && !e.admin))
    }
    document.getElementById('bottom').scrollIntoView({ behavior: 'auto', block: 'end'});
    // document.getElementById(`conv-${people}`).click();
  }

  const handleChange = (event) => { setInput(event.target.value)}

  const handleSubmit = () => {
    let info={};
    if(props.userType=='client'){
        info.from= {id: messages[0].client.id, type: 'client'};
        info.to= {id: messages[0].agency.id, type: 'agency'};
    } else {
        info.from= {id: messages[0].agency.id, type: 'agency'};
        info.to= {id: messages[0].client.id, type: 'client'};
    }
    info.content= input;
    info.adminBool= messages[0].admin;
    info.idHistory= messages[0].histories.id;

    axios.post(Routing.generate('profil_send_message'), info);
    // setInput('');
  }

  return (
    <Fragment>
      <div className="Conversations">
        <List selection verticalAlign='middle'>
          <List.Item onClick={() => handleConv('admin')}>
            <Image avatar src='../images/small-logo.png' />
            <List.Content>
              <List.Header>admin</List.Header>
            </List.Content>
          </List.Item>
          { convs.map((e) => {
              return (
                <List.Item id={`conv-${e.id}`} onClick={() => handleConv(e.id)}>
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
          <div className="list-messages">
            { messages.map((e) => {
                return (
                  <Message>
                    <p>{e.content}</p>
                    <small>{e.sendAt}</small>
                  </Message>
            )})}
            <div id="bottom"></div>
          </div>
          <div className="write-send">
            <Form onSubmit={() => {if(input!=''){handleSubmit()}}}>
              <Form.Group>
                <Form.Input placeholder='Ecrire un message' value={input} onChange={(event) => handleChange(event)} />
                <Form.Button content='>' />
              </Form.Group>
            </Form>
          </div>
      </div>
    </Fragment>
  )
}

export default Messages;
