import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure MvAlgebraPackage where
  lattice : LukasiewiczLatticePackage
  implication : lattice.carrier → lattice.carrier → lattice.carrier
  negation : lattice.carrier → lattice.carrier
  implicationLaws : Prop
  negationLaws : Prop
  mvAlgebraAxioms : Prop

def MvAlgebraClosed (M : MvAlgebraPackage) : Prop :=
  LukasiewiczLatticeClosed M.lattice ∧ M.implicationLaws ∧ M.negationLaws ∧ M.mvAlgebraAxioms

structure MvAlgebraEvidence (M : MvAlgebraPackage) where
  latticeClosed : LukasiewiczLatticeClosed M.lattice
  implicationLawsClosed : M.implicationLaws
  negationLawsClosed : M.negationLaws
  mvAlgebraAxiomsClosed : M.mvAlgebraAxioms

theorem mv_algebra_closed_from_evidence
    (M : MvAlgebraPackage) (E : MvAlgebraEvidence M) :
    MvAlgebraClosed M := by
  exact And.intro E.latticeClosed
    (And.intro E.implicationLawsClosed
      (And.intro E.negationLawsClosed E.mvAlgebraAxiomsClosed))

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
