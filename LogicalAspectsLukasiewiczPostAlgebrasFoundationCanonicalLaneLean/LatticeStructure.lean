import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LatticeStructurePackage where
  carrier : Type
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  bounded : Prop
  distributive : Prop
  joinAssoc : (a b c : carrier) → join (join a b) c = join a (join b c)
  meetAssoc : (a b c : carrier) → meet (meet a b) c = meet a (meet b c)
  absorption : (a b : carrier) → meet a (join a b) = a
  topElement : carrier
  bottomElement : carrier
  topBound : (a : carrier) → join a topElement = topElement ∧ meet a topElement = a
  bottomBound : (a : carrier) → join a bottomElement = a ∧ meet a bottomElement = bottomElement
  distributiveLaw : (a b c : carrier) → meet a (join b c) = join (meet a b) (meet a c)

structure LatticeStructureEvidence (L : LatticeStructurePackage) where
  boundedClosed : L.bounded
  distributiveClosed : L.distributive
  joinAssocClosed : ∀ a b c : L.carrier, L.joinAssoc a b c
  meetAssocClosed : ∀ a b c : L.carrier, L.meetAssoc a b c
  absorptionClosed : ∀ a b : L.carrier, L.absorption a b
  topBoundClosed : ∀ a : L.carrier, L.topBound a
  bottomBoundClosed : ∀ a : L.carrier, L.bottomBound a
  distributiveLawClosed : ∀ a b c : L.carrier, L.distributiveLaw a b c

def LatticeStructureClosed (L : LatticeStructurePackage) : Prop :=
  L.bounded ∧ L.distributive ∧ (∀ a b c : L.carrier, L.joinAssoc a b c) ∧
  (∀ a b c : L.carrier, L.meetAssoc a b c) ∧ (∀ a b : L.carrier, L.absorption a b) ∧
  (∀ a : L.carrier, L.topBound a) ∧ (∀ a : L.carrier, L.bottomBound a) ∧
  (∀ a b c : L.carrier, L.distributiveLaw a b c)

theorem lattice_structure_closed_from_evidence (L : LatticeStructurePackage)
    (E : LatticeStructureEvidence L) : LatticeStructureClosed L := by
  exact And.intro E.boundedClosed (And.intro E.distributiveClosed
    (And.intro E.joinAssocClosed (And.intro E.meetAssocClosed
      (And.intro E.absorptionClosed (And.intro E.topBoundClosed
        (And.intro E.bottomBoundClosed E.distributiveLawClosed))))))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse