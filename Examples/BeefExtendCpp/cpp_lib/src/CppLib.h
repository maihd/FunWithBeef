#pragma once

#include <vector>
#include <string>


class Node
{
public:
    float x;
    float y;

    std::vector<Node*> children;

public:
    virtual void Update(float dt);
    virtual void Draw();
};

class Sprite : Node
{
public:
    std::string image;

public:
    virtual void Update(float dt) override;
    virtual void Draw() override;
};

//! EOF
