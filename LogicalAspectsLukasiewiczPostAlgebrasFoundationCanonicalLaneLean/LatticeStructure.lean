import LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LatticeStructurePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  bounded : Prop
  distributive : Prop
  implicationDefined : Prop
  evidence : LatticeStructureEvidence

structure LatticeStructureEvidence (L : LatticeStructurePackage) where
  boundedClosed : L.bounded
  distributiveClosed : L.distributive
  implicationDefinedClosed : L.implicationDefined

def LatticeStructureClosed (L : LatticeStructurePackage) : Prop :=
  L.bounded ∧ L.distributive ∧ L.implicationDefined

theorem lattice_structure_closed_from_evidence
    (L : LatticeStructurePackage) (E : LatticeStructureEvidence L) :
    LatticeStructureClosed L := by
  exact And.intro E.boundedClosed (And.intro E.distributiveClosed E.implicationDefinedClosed)

end LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse