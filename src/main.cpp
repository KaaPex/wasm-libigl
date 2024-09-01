#include <iostream>
#include <igl/copyleft/cgal/mesh_boolean.h>
#include <Eigen/Dense>
#include <emscripten/bind.h>

// Function to perform a boolean operation on two meshes
void mesh_boolean(
    const Eigen::MatrixXd &V1,
    const Eigen::MatrixXi &F1,
    const Eigen::MatrixXd &V2,
    const Eigen::MatrixXi &F2,
    const std::string &operation,
    MatrixXd &Vout,
    MatrixXi &Fout)
{
    igl::MeshBooleanType boolean_type;
    if (operation == "union")
        boolean_type = igl::MESH_BOOLEAN_TYPE_UNION;
    else if (operation == "intersection")
        boolean_type = igl::MESH_BOOLEAN_TYPE_INTERSECT;
    else if (operation == "difference")
        boolean_type = igl::MESH_BOOLEAN_TYPE_MINUS;
    else if (operation == "xor")
        boolean_type = igl::MESH_BOOLEAN_TYPE_XOR;
    else if (operation == "resolve")
        boolean_type = igl::MESH_BOOLEAN_TYPE_RESOLVE;

    igl::copyleft::cgal::mesh_boolean(V1, F1, V2, F2, boolean_type, Vout, Fout);
}

// Binding code
EMSCRIPTEN_BINDINGS(mesh_module)
{
    emscripten::function("mesh_boolean", &mesh_boolean);
    emscripten::register_vector<double>("VectorDouble");
    emscripten::register_vector<int>("VectorInt");
}
