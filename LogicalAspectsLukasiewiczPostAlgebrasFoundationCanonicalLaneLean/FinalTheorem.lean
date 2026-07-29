import LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

def ConstrainedLukasiewiczPostAlgebraClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lukasiewicz_post_algebra_endgame (A : AdmissibleClass) :
    ConstrainedLukasiewiczPostAlgebraClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse