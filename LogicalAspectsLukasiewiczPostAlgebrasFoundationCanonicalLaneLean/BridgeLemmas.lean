import LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LukasiewiczPostAlgebraWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LogialAspectsLukasiewiczPostAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse