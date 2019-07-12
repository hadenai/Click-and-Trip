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
            from: {id: int, type: "agency"/"client"},
            to: {id: int, type: "agency"/"client"}
        }
    */
    public function sendMessage($object): void
    {
        $this->message->setHistories($this->historyRepo->findOneBy(['id' => $object->idHistory]))
                ->setAdmin($object->adminBool)
                ->setSendAt(new DateTime(date("Y-m-d H:i:s")))
                ->setContent($object->content);

        $to=[$object->to->type, $object->to->id];
        $from=[$object->from->type, $object->from->id];

        if ($from[0]=='agency') {
            $client=$this->clientRepo->findOneBy(['id' => $to[1]]);
            $this->message->setSender('agency')
                    ->setReceiver('client')
                    ->setAgency($this->agencyRepo->findOneBy(['id' => $from[1]]))
                    ->setClient($client);
            $toMail=$client->getEmail();
        } else {
            $agency=$this->agencyRepo->findOneBy(['id' => $to[1]]);
            $this->message->setSender('client')
                    ->setReceiver('agency')
                    ->setClient($this->clientRepo->findOneBy(['id' => $from[1]]))
                    ->setAgency($agency);
            $toMail=$agency->getEmail();
        }

        $this->manager->persist($this->message);
        $this->manager->flush();

        $this->mailer->sendMail($toMail);
    }
}
