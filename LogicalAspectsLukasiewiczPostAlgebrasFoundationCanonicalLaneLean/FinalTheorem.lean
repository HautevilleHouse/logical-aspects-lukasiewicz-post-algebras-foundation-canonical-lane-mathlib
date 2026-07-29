import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

def ConstrainedLukasiewiczPostClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lukasiewicz_post_endgame (A : AdmissibleClass) : ConstrainedLukasiewiczPostClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LogicalAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
