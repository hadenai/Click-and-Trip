<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\HistoryRepository")
 */
class History
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     */
    private $dateBegin;

    /**
     * @ORM\Column(type="date")
     */
    private $dateEnd;

    /**
     * @ORM\Column(type="smallint")
     */
    private $stateId;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Client", inversedBy="histories")
     * @ORM\JoinColumn(nullable=false)
     */
    private $client;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Agency", inversedBy="histories")
     * @ORM\JoinColumn(nullable=false)
     */
    private $agency;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Message", mappedBy="histories")
     */
    private $messages;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Stage", mappedBy="histories")
     */
    private $stages;

    public function __construct()
    {
        $this->messages = new ArrayCollection();
        $this->stages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateBegin(): ?\DateTimeInterface
    {
        return $this->dateBegin;
    }

    public function setDateBegin(\DateTimeInterface $dateBegin): self
    {
        $this->dateBegin = $dateBegin;

        return $this;
    }

    public function getDateEnd(): ?\DateTimeInterface
    {
        return $this->dateEnd;
    }

    public function setDateEnd(\DateTimeInterface $dateEnd): self
    {
        $this->dateEnd = $dateEnd;

        return $this;
    }

    public function getStateId(): ?int
    {
        return $this->stateId;
    }

    public function setStateId(int $stateId): self
    {
        $this->stateId = $stateId;

        return $this;
    }

    public function getClient(): ?Client
    {
        return $this->client;
    }

    public function setClient(?Client $client): self
    {
        $this->client = $client;

        return $this;
    }

    public function getAgency(): ?Agency
    {
        return $this->agency;
    }

    public function setAgency(?Agency $agency): self
    {
        $this->agency = $agency;

        return $this;
    }
    /**
     * @return Collection|Message[]
     */
    public function getMessages(): Collection
    {
        return $this->messages;
    }

    public function addMessages(Message $messages): self
    {
        if (!$this->messages->contains($messages)) {
            $this->messages[] = $messages;
            $messages->setHistory($this);
        }

        return $this;
    }

    public function removeMessages(Message $messages): self
    {
        if ($this->messages->contains($messages)) {
            $this->messages->removeElement($messages);
            // set the owning side to null (unless already changed)
            if ($messages->getHistory() === $this) {
                $messages->setHistory(null);
            }
        }

        return $this;
    }
    /**
     * @return Collection|Stage[]
     */
    public function getStages(): Collection
    {
        return $this->stages;
    }

    public function addStage(Stage $stage): self
    {
        if (!$this->stages->contains($stage)) {
            $this->stages[] = $stage;
            $stage->addHistories($this);
        }

        return $this;
    }

    public function removeStage(Stage $stage): self
    {
        if ($this->stages->contains($stage)) {
            $this->stages->removeElement($stage);
            $stage->removeHistories($this);
        }

        return $this;
    }

    public function __toString()
    {
        // to show the name of the Category in the select
        // return $this->histories;
        // to show the id of the Category in the select
        return strval($this->id);
    }
}
