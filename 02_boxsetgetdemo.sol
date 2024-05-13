pragma solidity >=0.8.2 <0.9.0;


contract Box {
    uint height;
    uint width;
    uint depth;

    constructor(uint h, uint w, uint d) {
        height = h;
        width = w;
        depth = d;
    }

    function get_volume() public view returns (uint) {
        return uint(height*width*depth);
    }

    function setHeight(uint h) public {
        height = h;
    }

    function setWidth(uint w) public {
        width = w;
    }

    function setDepth(uint d) public {
        depth = d;
    }

    function getHeight() public view returns (uint) {
        return height;
    }
    
    function getWidth() public view returns (uint) {
        return width;
    }

    function getDepth() public view returns (uint) {
        return depth;
    }

}
