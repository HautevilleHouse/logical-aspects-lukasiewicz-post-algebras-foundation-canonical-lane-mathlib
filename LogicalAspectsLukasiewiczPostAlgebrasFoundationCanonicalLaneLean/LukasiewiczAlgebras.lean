import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LukasiewiczAlgebrasPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  negation : carrier → carrier
  implication : carrier → carrier → carrier
  constantZero : carrier
  constantOne : carrier
  axiomsSatisfied : Prop
  latticeStructure : Prop
  mvAlgebraAxioms : Prop
  completeness : Prop

structure LukasiewiczAlgebrasEvidence (L : LukasiewiczAlgebrasPackage) where
  axiomsSatisfiedClosed : L.axiomsSatisfied
  latticeStructureClosed : L.latticeStructure
  mvAlgebraAxiomsClosed : L.mvAlgebraAxioms
  completenessClosed : L.completeness

def LukasiewiczAlgebrasClosed (L : LukasiewiczAlgebrasPackage) : Prop :=
  L.axiomsSatisfied ∧ L.latticeStructure ∧ L.mvAlgebraAxioms ∧ L.completeness

theorem lukasiewicz_algebras_closed_from_evidence (L : LukasiewiczAlgebrasPackage) (E : LukasiewiczAlgebrasEvidence L) : LukasiewiczAlgebrasClosed L := by
  exact And.intro E.axiomsSatisfiedClosed (And.intro E.latticeStructureClosed (And.intro E.mvAlgebraAxiomsClosed E.completenessClosed))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
