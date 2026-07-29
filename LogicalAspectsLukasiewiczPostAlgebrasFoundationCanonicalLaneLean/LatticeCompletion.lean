import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure LatticeCompletionPackage (M : MVAlgebraPackage) where
  ideals : Type u
  idealInclusion : M.carrier → ideals
  idealMeet : ideals → ideals → ideals
  idealJoin : ideals → ideals → ideals
  completionClosed : Prop

structure LatticeCompletionEvidence {M : MVAlgebraPackage} (L : LatticeCompletionPackage M) where
  completionClosedClosed : L.completionClosed

def LatticeCompletionClosed {M : MVAlgebraPackage} (L : LatticeCompletionPackage M) : Prop :=
  L.completionClosed

theorem lattice_completion_closed_from_evidence {M : MVAlgebraPackage} (L : LatticeCompletionPackage M)
    (E : LatticeCompletionEvidence L) : LatticeCompletionClosed L :=
  E.completionClosedClosed

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
