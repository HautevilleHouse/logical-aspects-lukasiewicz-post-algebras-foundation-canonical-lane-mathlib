import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure PostAlgebraPackage where
  mvAlgebra : MvAlgebraPackage
  chainOfIdempotents : mvAlgebra.lattice.carrier → mvAlgebra.lattice.carrier → Prop
  idempotentChainProperty : Prop
  postConstants : mvAlgebra.lattice.carrier → Prop
  postAxioms : Prop

def PostAlgebraClosed (P : PostAlgebraPackage) : Prop :=
  MvAlgebraClosed P.mvAlgebra ∧ P.idempotentChainProperty ∧ P.postAxioms

structure PostAlgebraEvidence (P : PostAlgebraPackage) where
  mvAlgebraClosed : MvAlgebraClosed P.mvAlgebra
  idempotentChainPropertyClosed : P.idempotentChainProperty
  postAxiomsClosed : P.postAxioms

theorem post_algebra_closed_from_evidence
    (P : PostAlgebraPackage) (E : PostAlgebraEvidence P) :
    PostAlgebraClosed P := by
  exact And.intro E.mvAlgebraClosed
    (And.intro E.idempotentChainPropertyClosed E.postAxiomsClosed)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
