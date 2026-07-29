import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure AdmissibleLPAObject where
  mvAlgebra : MVAlgebraPackage
  postAlgebra : PostAlgebraPackage mvAlgebra
  latticeCompletion : LatticeCompletionPackage mvAlgebra
  representation : RepresentationTheoremPackage mvAlgebra postAlgebra latticeCompletion

structure LPAClosureObject where
  object : AdmissibleLPAObject

def LPAWitnessClosed (O : AdmissibleLPAObject) : Prop :=
  MVAlgebraClosed O.mvAlgebra ∧
  PostAlgebraClosed O.postAlgebra ∧
  LatticeCompletionClosed O.latticeCompletion ∧
  RepresentationTheoremClosed O.representation

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
