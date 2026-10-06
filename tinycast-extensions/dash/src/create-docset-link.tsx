import { Clipboard, showHUD } from "@raycast/api";
import { createDeeplinkForDocset } from "./utils";

// Tinycast can't launch Raycast's built-in create-quicklink command, so hand over the link instead.
export default async function Command(props: { arguments: { docset: string } }) {
  const { docset } = props.arguments;
  await Clipboard.copy(createDeeplinkForDocset(docset));
  await showHUD(`Copied “${docset}” docset link — paste it into Create Quicklink`);
}
