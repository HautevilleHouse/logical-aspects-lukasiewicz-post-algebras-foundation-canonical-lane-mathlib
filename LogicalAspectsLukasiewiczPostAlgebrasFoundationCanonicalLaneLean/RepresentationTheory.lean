import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

structure RepresentationTheoremPackage (M : MVAlgebraPackage) (P : PostAlgebraPackage M) (L : LatticeCompletionPackage M) where
  stoneRepresentation : Prop
  primeSpectrum : Type u
  representationIsomorphism : Prop
  dualAdjunction : Prop

structure RepresentationTheoremEvidence {M : MVAlgebraPackage} {P : PostAlgebraPackage M}
    {L : LatticeCompletionPackage M} (R : RepresentationTheoremPackage M P L) where
  stoneRepresentationClosed : R.stoneRepresentation
  representationIsomorphismClosed : R.representationIsomorphism
  dualAdjunctionClosed : R.dualAdjunction

def RepresentationTheoremClosed {M : MVAlgebraPackage} {P : PostAlgebraPackage M}
    {L : LatticeCompletionPackage M} (R : RepresentationTheoremPackage M P L) : Prop :=
  R.stoneRepresentation ∧ R.representationIsomorphism ∧ R.dualAdjunction

theorem representation_theorem_closed_from_evidence {M : MVAlgebraPackage} {P : PostAlgebraPackage M}
    {L : LatticeCompletionPackage M} (R : RepresentationTheoremPackage M P L)
    (E : RepresentationTheoremEvidence R) : RepresentationTheoremClosed R :=
  And.intro E.stoneRepresentationClosed
    (And.intro E.representationIsomorphismClosed E.dualAdjunctionClosed)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
