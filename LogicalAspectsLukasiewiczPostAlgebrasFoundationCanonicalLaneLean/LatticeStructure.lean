import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LukasiewiczLatticePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  bottom : carrier
  top : carrier
  complement : carrier → carrier
  latticeLaws : Prop
  bounded : Prop
  pseudocomplemented : Prop
  stoneIdentity : Prop

def LukasiewiczLatticeClosed (L : LukasiewiczLatticePackage) : Prop :=
  L.latticeLaws ∧ L.bounded ∧ L.pseudocomplemented ∧ L.stoneIdentity

structure LukasiewiczLatticeEvidence (L : LukasiewiczLatticePackage) where
  latticeLawsClosed : L.latticeLaws
  boundedClosed : L.bounded
  pseudocomplementedClosed : L.pseudocomplemented
  stoneIdentityClosed : L.stoneIdentity

theorem lukasiewicz_lattice_closed_from_evidence
    (L : LukasiewiczLatticePackage) (E : LukasiewiczLatticeEvidence L) :
    LukasiewiczLatticeClosed L := by
  exact And.intro E.latticeLawsClosed
    (And.intro E.boundedClosed
      (And.intro E.pseudocomplementedClosed E.stoneIdentityClosed))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
