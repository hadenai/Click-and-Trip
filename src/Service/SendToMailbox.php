<?php

namespace App\Service;

use DateTime;
use App\Entity\Message;
use App\Service\Mailer;
use App\Repository\AgencyRepository;
use App\Repository\ClientRepository;
use App\Repository\HistoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;

class SendToMailbox
{
    private $environment;
    private $clientRepo;
    private $agencyRepo;
    private $historyRepo;
    private $mailer;
    private $request;
    private $message;
    private $manager;

    public function __construct(
        \Twig\Environment $environment,
        AgencyRepository $agencyRepo,
        ClientRepository $clientRepo,
        HistoryRepository $historyRepo,
        Request $request,
        Mailer $mailer,
        Message $message,
        ObjectManager $manager
    ) {
        $this->environment = $environment;
        $this->clientRepo = $clientRepo;
        $this->agencyRepo = $agencyRepo;
        $this->historyRepo = $historyRepo;
        $this->mailer = $mailer;
        $this->request = $request;
        $this->message = $message;
        $this->manager = $manager;
    }

    /*
        give $object as an object w/ the following structures
        {
            idHistory: int,
            content: string,
            adminBool: boolean,
            from: {id: int, type: "agency"/"client"/"admin"},
            to: {id: int, type: "agency"/"client"/"admin"}
        }
    */
    public function sendMessage($object): void
    {
        $this->message->setHistories($this->historyRepo->findOneBy(['id' => $object->idHistory]))
                ->setAdmin($object->adminBool)
                ->setSendAt(new DateTime(date("Y-m-d H:i:s")))
                ->setContent($object->content);

        $to=[$object->to->id, $object->to->type];
        $from=[$object->from->id, $object->from->type];

        if ($from[1]=='agency') {
            $this->message->setSender('agency')
                          ->setAgency($this->agencyRepo->findOneBy(['id' => $from[0]]));
            if ($to[1]=='user') {
                $this->message->setReceiver('user')
                              ->setClient($this->message->getHistory()->getClient());
                $toMail=$_ENV['MAILER_ADDRESS'];
            } else {
                $client=$this->clientRepo->findOneBy(['id' => $to[0]]);
                $this->message->setReceiver('client')
                              ->setClient($client);
                $toMail=$client->getEmail();
            }
        } elseif ($from[1]=='client') {
            $this->message->setSender('client')
                          ->setClient($this->clientRepo->findOneBy(['id' => $from[0]]));
            if ($to[1]=='user') {
                $this->message->setReceiver('user')
                              ->setAgency($this->message->getHistory()->getAgency());
                $toMail=$_ENV['MAILER_ADDRESS'];
            } else {
                $agency=$this->agencyRepo->findOneBy(['id' => $to[0]]);
                $this->message->setReceiver('agency')
                              ->setAgency($agency);
                $toMail=$agency->getEmail();
            }
        } else {
            $this->message->setSender('user');
            if ($to[1]=='client') {
                $client=$this->clientRepo->findOneBy(['id' => $to[0]]);
                $this->message->setReceiver('client')
                              ->setClient($client)
                              ->setAgency($this->message->getHistory()->getAgency());
                $toMail=$client->getEmail();
            } else {
                $agency=$this->agencyRepo->findOneBy(['id' => $to[0]]);
                $this->message->setReceiver('agency')
                              ->setAgency($agency)
                              ->setClient($this->message->getHistory()->getClient());
                $toMail=$agency->getEmail();
            }
        }

        $this->manager->persist($this->message);
        $this->manager->flush();

        $this->mailer->sendMail($toMail);
    }
}
