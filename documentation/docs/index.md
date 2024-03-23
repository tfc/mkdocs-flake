
# mkdocs-flake

<div class="grid cards" markdown>

- :simple-materialformkdocs: Pre-Bundled easy to use [Mkdocs](https://www.mkdocs.org/)
- :simple-materialdesign: Cool [Mkdocs Material Design](https://squidfunk.github.io/mkdocs-material)
- :material-image-edit: Markdown-integrated [PlantUML](https://plantuml.com/)
- :octicons-code-review-24: [Code Blocks](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/) with highlights and annotations
- :simple-nixos: Available as [Nix](https://nixos.org/) Flake
- :simple-nixos: Available as [Flake-parts](https://flake.parts/) module
- :simple-docker: Available as [Docker](https://www.docker.com/) Image

</div>

## Tooltips

bla
[Hover me](https://example.com "I'm a tooltip!") bla.
lol


## Math

<https://squidfunk.github.io/mkdocs-material/reference/math/#katex-mkdocsyml>

$$
\operatorname{ker} f=\{g\in G:f(g)=e_{H}\}{\mbox{.}}
$$

!!! note

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

bla bla

![Documentation should be easy and pretty](forgot-docs.jpg){ width="400" }

[Send :fontawesome-solid-paper-plane:](#){ .md-button }


## PlantUML Diagrams

```plantuml
@startuml
!include <edgy/edgy>

$experienceFacet(Experience, experience)
$architectureFacet(Architecture, architecture)
$identityFacet(Identity, identity)

$organisationFacet(Organisation, org) {
	$organisation(Organisation, organisation)
}

$brandFacet(Brand) {
	$brand(Brand, brand)
}

$productFacet(Product){
	$product(Product, product)
}

$flow(brand, identity, "represents/evokes")
$flow(brand, experience, "Supports/appears in")

$flowLeft(organisation, identity, "pursues/authors")
$flowRight(organisation, architecture, "has/performs")

$flow(product, experience, "serves/features in")
$linkUp(product, architecture, "requires/creates")

$flow(organisation, brand, "builds")
$flow(organisation, product, "makes")
$flowLeft(product, brand, "embodies")

@enduml
```
