<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MessageRepository")
 */
class Message
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $sendAt;

    /**
     * @ORM\Column(type="string", length=10000)
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\History", inversedBy="messages")
     * @ORM\JoinColumn(nullable=false)
     */
    private $histories;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Agency", mappedBy="message")
     * @ORM\JoinColumn(nullable=true)
     */
    private $Agency;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Client", mappedBy="message")
     * @ORM\JoinColumn(nullable=true)
     */
    private $Client;

    public function __construct()
    {
        $this->Agency = new ArrayCollection();
        $this->Client = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSendAt(): ?\DateTimeInterface
    {
        return $this->sendAt;
    }

    public function setSendAt(\DateTimeInterface $sendAt): self
    {
        $this->sendAt = $sendAt;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getHistory(): ?History
    {
        return $this->histories;
    }

    public function setHistory(?History $history): self
    {
        $this->histories = $history;

        return $this;
    }

    /**
     * @return Collection|Agency[]
     */
    public function getAgency(): Collection
    {
        return $this->Agency;
    }

    public function addAgency(Agency $agency): self
    {
        if (!$this->Agency->contains($agency)) {
            $this->Agency[] = $agency;
            $agency->setMessage($this);
        }

        return $this;
    }

    public function removeAgency(Agency $agency): self
    {
        if ($this->Agency->contains($agency)) {
            $this->Agency->removeElement($agency);
            // set the owning side to null (unless already changed)
            if ($agency->getMessage() === $this) {
                $agency->setMessage(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Client[]
     */
    public function getClient(): Collection
    {
        return $this->Client;
    }

    public function addClient(Client $client): self
    {
        if (!$this->Client->contains($client)) {
            $this->Client[] = $client;
            $client->setMessage($this);
        }

        return $this;
    }

    public function removeClient(Client $client): self
    {
        if ($this->Client->contains($client)) {
            $this->Client->removeElement($client);
            // set the owning side to null (unless already changed)
            if ($client->getMessage() === $this) {
                $client->setMessage(null);
            }
        }

        return $this;
    }
}
