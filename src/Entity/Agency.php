<?php

namespace App\Entity;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AgencyRepository")
 */
class Agency implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;


    /**
     * @ORM\Column(type="string", length=180, unique=true)
     * @Assert\Email(  message = "The email '{{ value }}' is not a valid email.")
     */
    private $email;
    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     * @Assert\Length(min="8", minMessage="Votre mot de passe doit faire minimun 8 caractères" )
     * @Assert\EqualTo
     * (propertyPath="confirm_password", message="Votre mot de passe doit être le même que celui que vous confirmer")
     */
    private $password;

    public $confirm_password;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $country;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $city;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $address;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups("api")
     */
    private $company;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nameAgent;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $surnameAgent;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\History", mappedBy="agency")
     */
    private $histories;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Stage", mappedBy="agency", orphanRemoval=true)
     */
    private $stages;

    /**
     * @ORM\Column(type="integer")
     */
    private $yearCreation;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="text")
     */
    private $presentation;

    /**
     * @ORM\Column(type="text")
     */
    private $flagship;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Documents", mappedBy="agency", orphanRemoval=true)
     */
    private $documents;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $deleted = false;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $mobile;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $validate=false;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Message", mappedBy="agency", orphanRemoval=true)
     */
    private $messages;

    public function __construct()
    {
        $this->histories = new ArrayCollection();
        $this->stages = new ArrayCollection();
        $this->documents = new ArrayCollection();
        $this->messages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }


    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getCountry(): ?string
    {
        return $this->country;
    }

    public function setCountry(string $country): self
    {
        $this->country = $country;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getCompany(): ?string
    {
        return $this->company;
    }

    public function setCompany(string $company): self
    {
        $this->company = $company;

        return $this;
    }

    public function getNameAgent(): ?string
    {
        return $this->nameAgent;
    }

    public function setNameAgent(string $nameAgent): self
    {
        $this->nameAgent = $nameAgent;

        return $this;
    }

    public function getSurnameAgent(): ?string
    {
        return $this->surnameAgent;
    }

    public function setSurnameAgent(string $surnameAgent): self
    {
        $this->surnameAgent = $surnameAgent;

        return $this;
    }

    /**
     * @return Collection|History[]
     */
    public function getHistories(): Collection
    {
        return $this->histories;
    }

    public function addHistory(History $history): self
    {
        if (!$this->histories->contains($history)) {
            $this->histories[] = $history;
            $history->setAgency($this);
        }

        return $this;
    }

    public function removeHistory(History $history): self
    {
        if ($this->histories->contains($history)) {
            $this->histories->removeElement($history);
            // set the owning side to null (unless already changed)
            if ($history->getAgency() === $this) {
                $history->setAgency(null);
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
            $stage->setAgency($this);
        }

        return $this;
    }

    public function removeStage(Stage $stage): self
    {
        if ($this->stages->contains($stage)) {
            $this->stages->removeElement($stage);
            // set the owning side to null (unless already changed)
            if ($stage->getAgency() === $this) {
                $stage->setAgency(null);
            }
        }

        return $this;
    }

    public function getYearCreation(): ?int
    {
        return $this->yearCreation;
    }

    public function setYearCreation(int $yearCreation): self
    {
        $this->yearCreation = $yearCreation;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPresentation(): ?string
    {
        return $this->presentation;
    }

    public function setPresentation(string $presentation): self
    {
        $this->presentation = $presentation;

        return $this;
    }

    public function getFlagship(): ?string
    {
        return $this->flagship;
    }

    public function setFlagship(string $flagship): self
    {
        $this->flagship = $flagship;

        return $this;
    }

    /**
     * @return Collection|Documents[]
     */
    public function getDocuments(): Collection
    {
        return $this->documents;
    }

    public function addDocument(Documents $document): self
    {
        if (!$this->documents->contains($document)) {
            $this->documents[] = $document;
            $document->setAgency($this);
        }

        return $this;
    }

    public function removeDocument(Documents $document): self
    {
        if ($this->documents->contains($document)) {
            $this->documents->removeElement($document);
            // set the owning side to null (unless already changed)
            if ($document->getAgency() === $this) {
                $document->setAgency(null);
            }
        }

        return $this;
    }

    public function getDeleted(): ?bool
    {
        return $this->deleted;
    }

    public function setDeleted(bool $deleted): self
    {
        $this->deleted = $deleted;
    }

    public function getMobile(): ?string
    {
        return $this->mobile;
    }

    public function setMobile(string $mobile): self
    {
        $this->mobile = $mobile;

        return $this;
    }

    public function getValidate(): ?bool
    {
        return $this->validate;
    }

    public function setValidate(bool $validate): self
    {
        $this->validate = $validate;

        return $this;
    }

    public function __toString()
    {
        return $this->company;
    }

    /**
     * @return Collection|Message[]
     */
    public function getMessages(): Collection
    {
        return $this->messages;
    }

    public function addMessage(Message $message): self
    {
        if (!$this->messages->contains($message)) {
            $this->messages[] = $message;
            $message->setAgency($this);
        }

        return $this;
    }

    public function removeMessage(Message $message): self
    {
        if ($this->messages->contains($message)) {
            $this->messages->removeElement($message);
            // set the owning side to null (unless already changed)
            if ($message->getAgency() === $this) {
                $message->setAgency(null);
            }
        }

        return $this;
    }
}
