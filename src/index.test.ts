import { parser } from "./index";

describe("平叙文", () => {
  it("molo li molo", () => {
    const generatedSyntaxTree = parser.parse("molo li molo");
    const wantedSyntaxTree = {
      head: "molo",
      tail: {
        head: "li",
        tail: "molo",
      },
    };
    expect(generatedSyntaxTree).toEqual(wantedSyntaxTree);
  });
  it("molo li molo to molo", () => {
    const generatedSyntaxTree = parser.parse("molo li molo to molo");
    const wantedSyntaxTree = {
      head: "molo",
      tail: {
        head: { head: "li", tail: "molo" },
        tail: { head: "to", tail: "molo" },
      },
    };
    expect(generatedSyntaxTree).toEqual(wantedSyntaxTree);
  });
});

describe("疑問文", () => {
  it("su molo li molo", () => {
    const generatedSyntaxTree = parser.parse("su molo li molo");
    const wantedSyntaxTree = {
      head: "su",
      tail: {
        head: "molo",
        tail: {
          head: "li",
          tail: "molo",
        },
      },
    };
    expect(generatedSyntaxTree).toEqual(wantedSyntaxTree);
  });
});
