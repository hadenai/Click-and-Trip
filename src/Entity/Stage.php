<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\StageRepository")
 */
class Stage
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="boolean")
     */
    private $validate;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $destination;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $reference;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nameStage;

    /**
     * @ORM\Column(type="time")
     */
    private $duration;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Agency", inversedBy="stages")
     * @ORM\JoinColumn(nullable=false)
     */
    private $agency;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\History", inversedBy="stages")
     */
    private $history;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Theme", mappedBy="stage")
     */
    private $themes;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Style", mappedBy="stage")
     */
    private $styles;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Price", mappedBy="stage")
     */
    private $prices;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Size", mappedBy="stage")
     */
    private $sizes;

    public function __construct()
    {
        $this->history = new ArrayCollection();
        $this->themes = new ArrayCollection();
        $this->styles = new ArrayCollection();
        $this->prices = new ArrayCollection();
        $this->sizes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getDestination(): ?string
    {
        return $this->destination;
    }

    public function setDestination(string $destination): self
    {
        $this->destination = $destination;

        return $this;
    }

    public function getReference(): ?string
    {
        return $this->reference;
    }

    public function setReference(string $reference): self
    {
        $this->reference = $reference;

        return $this;
    }

    public function getNameStage(): ?string
    {
        return $this->nameStage;
    }

    public function setNameStage(string $nameStage): self
    {
        $this->nameStage = $nameStage;

        return $this;
    }

    public function getDuration(): ?\DateTimeInterface
    {
        return $this->duration;
    }

    public function setDuration(\DateTimeInterface $duration): self
    {
        $this->duration = $duration;

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
     * @return Collection|History[]
     */
    public function getHistory(): Collection
    {
        return $this->history;
    }

    public function addHistory(History $history): self
    {
        if (!$this->history->contains($history)) {
            $this->history[] = $history;
        }

        return $this;
    }

    public function removeHistory(History $history): self
    {
        if ($this->history->contains($history)) {
            $this->history->removeElement($history);
        }

        return $this;
    }

    /**
     * @return Collection|Theme[]
     */
    public function getThemes(): Collection
    {
        return $this->themes;
    }

    public function addTheme(Theme $theme): self
    {
        if (!$this->themes->contains($theme)) {
            $this->themes[] = $theme;
            $theme->addStage($this);
        }

        return $this;
    }

    public function removeTheme(Theme $theme): self
    {
        if ($this->themes->contains($theme)) {
            $this->themes->removeElement($theme);
            $theme->removeStage($this);
        }

        return $this;
    }

    /**
     * @return Collection|Style[]
     */
    public function getStyles(): Collection
    {
        return $this->styles;
    }

    public function addStyle(Style $style): self
    {
        if (!$this->styles->contains($style)) {
            $this->styles[] = $style;
            $style->addStage($this);
        }

        return $this;
    }

    public function removeStyle(Style $style): self
    {
        if ($this->styles->contains($style)) {
            $this->styles->removeElement($style);
            $style->removeStage($this);
        }

        return $this;
    }

    /**
     * @return Collection|Price[]
     */
    public function getPrices(): Collection
    {
        return $this->prices;
    }

    public function addPrice(Price $price): self
    {
        if (!$this->prices->contains($price)) {
            $this->prices[] = $price;
            $price->setStage($this);
        }

        return $this;
    }

    public function removePrice(Price $price): self
    {
        if ($this->prices->contains($price)) {
            $this->prices->removeElement($price);
            // set the owning side to null (unless already changed)
            if ($price->getStage() === $this) {
                $price->setStage(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Size[]
     */
    public function getSizes(): Collection
    {
        return $this->sizes;
    }

    public function addSize(Size $size): self
    {
        if (!$this->sizes->contains($size)) {
            $this->sizes[] = $size;
            $size->addStage($this);
        }

        return $this;
    }

    public function removeSize(Size $size): self
    {
        if ($this->sizes->contains($size)) {
            $this->sizes->removeElement($size);
            $size->removeStage($this);
        }

        return $this;
    }
}
