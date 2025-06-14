#pragma once

#include <vector>
#include <string>

#if defined(_WIN32)
    #if defined(CPP_LIB_EXPORT)
        #define CPP_LIB_API __declspec(dllexport)
    #else
        #define CPP_LIB_API __declspec(dllimport)
    #endif
#else
    #define CPP_LIB_API extern
#endif


class CPP_LIB_API Node
{
private:
    float x;
    float y;

    std::vector<Node*> children;

public:
    Node();
    virtual ~Node();

public:
    virtual void Update(float dt);
    virtual void Draw();
};


class CPP_LIB_API Sprite : public Node
{
private:
    std::string image = "";

public:
    Sprite();
    virtual ~Sprite() override;

public:
    virtual void Update(float dt) override;
    virtual void Draw() override;
};


// C Bindings
extern "C" 
{
    CPP_LIB_API Node* Node_Create(void);
    CPP_LIB_API void Node_Destroy(Node* node);


    CPP_LIB_API Sprite* Sprite_Create(void);
    CPP_LIB_API void Sprite_Destroy(Sprite* sprite);


    // Virtual Methods


    CPP_LIB_API void Node_Update(Node* sprite, float dt);
    CPP_LIB_API void Node_Draw(Node* sprite);


    CPP_LIB_API void Sprite_Update(Sprite* sprite, float dt);
    CPP_LIB_API void Sprite_Draw(Sprite* sprite);
}

//! EOF
